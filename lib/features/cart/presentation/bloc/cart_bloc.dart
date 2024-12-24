import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_customer/features/app/data/models/pagination_model.dart';
import 'package:restaurant_customer/features/cart/data/model/address_model.dart';
import 'package:restaurant_customer/common/models/page_state/bloc_status.dart';
import 'package:restaurant_customer/features/cart/data/model/cart_model.dart';
import 'package:restaurant_customer/features/cart/data/model/coupon_model.dart';
import 'package:restaurant_customer/features/cart/domain/use_case/add_order_use_case.dart';
import 'package:restaurant_customer/features/cart/domain/use_case/get_all_coupons_use_case.dart';
import 'package:restaurant_customer/features/cart/domain/use_case/get_cart_use_case.dart';
import 'package:restaurant_customer/features/cart/domain/use_case/remove_item_use_case.dart';
import 'package:restaurant_customer/features/cart/domain/use_case/update_cart_use_case.dart';

import '../../../../common/models/page_state/page_state.dart';
import '../../../../core/helper/helper_function.dart';
import '../../../../core/network/api_utils.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/extra_item.dart';
import '../../domain/use_case/apply_coupon_use_case.dart';
import '../../domain/use_case/get_all_address_use_case.dart';
import '../../domain/use_case/add_to_cart_usecase.dart';
import '../../domain/use_case/update_extra_item_use_case.dart';
import 'package:collection/collection.dart';

part 'cart_event.dart';

part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final UpdateCartUseCase updateCartUseCase;
  final UpdateExtraItemUseCase updateExtraItemUseCase;
  final GetCartUseCase getCartUseCase;
  final AddOrderUseCase addOrderUseCase;
  final GetAllAddressUseCase getAllAddressUseCase;
  final GetAllCouponsUseCase getAllCouponsUseCase;
  final RemoveItemUseCase removeItemUseCase;
  final ApplyCouponUseCase applyCouponUseCase;
  final AddToCartCartUseCase addToCartCartUseCase;

  bool isSendOrder = true;
  final int _second = 5;

  CartBloc(
      this.addOrderUseCase,
      this.applyCouponUseCase,
      this.removeItemUseCase,
      this.getCartUseCase,
      this.addToCartCartUseCase,
      this.getAllAddressUseCase,
      this.getAllCouponsUseCase,
      this.updateCartUseCase,
      this.updateExtraItemUseCase)
      : super(const CartState()) {
    on<GetCartEvent>(_onGetCartEvent);
    on<ApplyCouponEvent>(_onApplyCouponEvent);

    on<UpdateExtraItemEvent>(_onUpdateExtraItemEvent);
    on<AddToCartEvent>(_onAddToCartEvent);
    on<ToggleItemCartEvent>(_onToggleItemCartEvent);

    on<GetAllAddressEvent>(_onGetAllAddressEvent);
    on<GetAllCouponsEvent>(_onGetAllCouponsEvent);
    on<UpdateCartLocalEvent>(
      (event, emit) {
        updateSequentialCount(event.isAddSequential, emit);

        _onUpdateCartLocalEvent(event, emit);
      },
    );

    ///The UpdateCartEvent,RemoveItemEvent and AddOrderEvent events are scheduled sequentially to complete all UpdateCartEvent and RemoveItemEvent events processing before the AddOrderEvent event is triggered.
    on<CartEvent>(
      (event, emit) async {
        if (event is UpdateCartEvent) {
          await _onUpdateCartEvent(
              event.copyWith(
                onFailure: () {
                  updateSequentialCount(false, emit);

                  ///Cancel the AddOrderEvent event if any event registered before it fails
                  isSendOrder = false;
                },
                onSuccess: () => updateSequentialCount(false, emit),
              ),
              emit);
        } else if (event is RemoveItemEvent) {
          updateSequentialCount(event.isAddSequential, emit);

          await _onRemoveItemEvent(
              event.copyWith(
                onFailure: () {
                  updateSequentialCount(false, emit);
                  isSendOrder = false;
                },
                onSuccess: () => updateSequentialCount(false, emit),
              ),
              emit);
        } else if (event is AddOrderEvent) {
          await _onAddOrderEvent(event, emit);
        }
      },
      transformer: sequential(),
    );
  }

  ///This method shows the loading prices if there are events (UpdateCartEvent,RemoveItemEvent)in progress.
  void updateSequentialCount(bool? isAdd, Emitter<CartState> emit) {
    ///isAdd=null: If event is RemoveItemEvent and This item has a pending UpdateCartEvent event registered.
    if (isAdd != null) {
      emit(state.copyWith(
        sequentialEventsCount: isAdd

            ///When registering a new event
            ? state.sequentialEventsCount + 1

            ///When a recorded event ends
            : state.sequentialEventsCount - 1,
      ));
    }

    ///When all the recorded events are finished, the timer is reset to hide the loading prices.
    if (state.sequentialEventsCount == 0) {
      emit(state.copyWith(durations: const Duration(seconds: 0)));
    }
  }

  void _onUpdateCartLocalEvent(
      UpdateCartLocalEvent event, Emitter<CartState> emit) {
    emit(state.copyWith(
        durations: Duration(seconds: _second),
        getCartState: PageState.loaded(
            data: state.getCartState.data.copyWith(
                items: state.getCartState.data.items
                    ?.map(
                      (e) => e.id == event.itemId
                          ? event.isIncrement
                              ? e.copyWith(quantity: e.quantity! + 1)
                              : e.copyWith(quantity: e.quantity! - 1)
                          : e,
                    )
                    .toList()))));
  }

  Future<void> _onUpdateCartEvent(
      UpdateCartEvent event, Emitter<CartState> emit) async {
    final num quantity = state.getCartState.data.items
            ?.firstWhere(
              (element) => element.id == event.id,
            )
            .quantity ??
        1;

    emit(state.copyWith(updateCart: const BlocStatus.loading()));

    final result = await updateCartUseCase(CartParams(
        quantity: quantity,
        addressId: state.addressId,
        code: state.code,
        storeId: event.storeId,
        id: event.id));

    result.fold((error) {
      emit(state.copyWith(
        updateCart: BlocStatus.fail(error: error.message),
        getCartState: PageState.loaded(
            data: state.getCartState.data.copyWith(
                items: state.getCartState.data.items
                    ?.map((e) => e.id == event.id
                        ? e.copyWith(quantity: e.originalQuantity)
                        : e)
                    .toList())),
      ));
      event.onFailure?.call();
    }, (right) {
      emit(state.copyWith(
          getCartState: PageState.loaded(
              data: state.getCartState.data.copyWith(
                  items: state.getCartState.data.items
                      ?.map((e) => e.id == event.id
                          ? e.copyWith(originalQuantity: quantity)
                          : e)
                      .toList())),
          updateCart: const BlocStatus.success(),
          deliveryPrice: right.deliveryPrice,
          couponValue: right.couponValue,
          totalPriceAfterDiscount: right.totalPriceAfterDiscount,
          totalPrice: right.totalPrice,
          priceAll: right.priceAll));
      event.onSuccess?.call();
    });
  }

  Future<void> _onGetCartEvent(
      GetCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(getCartState: const PageState.loading()));
    final result = await getCartUseCase(CartParams(
        addressId: state.addressId, code: state.code, storeId: event.storeId));

    result.fold(
        (error) => emit(state.copyWith(
            getCartState:
                PageState.error(exception: error, message: error.message))),
        (right) {
      if (right.items?.isEmpty ?? true) {
        emit(state.copyWith(getCartState: const PageState.empty()));
      } else {
        emit(state.copyWith(
            getCartState: PageState.loaded(data: right),
            deliveryPrice: right.deliveryPrice,
            couponValue: right.couponValue,
            totalPriceAfterDiscount: right.totalPriceAfterDiscount,
            totalPrice: right.totalPrice,
            priceAll: right.priceAll));
      }
    });
  }

  Future<void> _onUpdateExtraItemEvent(
      UpdateExtraItemEvent event, Emitter<CartState> emit) async {
    List<CartItemModel> newItems = List.of(state.getCartState.data.items ?? []);
    List<ExtraItemModel> newExtraItem = List.of(event.extraItems);
    newExtraItem = newExtraItem
      ..removeWhere(
        (element) => !element.selected,
      );

    newItems = newItems
        .map(
          (e) =>
              event.cartId == e.id ? e.copyWith(extraItems: newExtraItem) : e,
        )
        .toList();

    emit(state.copyWith(
      updateExtraItem: const BlocStatus.loading(),
    ));
    final result = await updateExtraItemUseCase(UpdateExtraItemParams(
        cartId: event.cartId,
        code: state.code,
        addressId: state.addressId,
        storeId: event.storeId,
        extraItems: event.extraItems));

    result.fold(
      (error) => emit(state.copyWith(
        updateExtraItem: BlocStatus.fail(error: error.message),
      )),
      (right) {
        emit(
          state.copyWith(
              updateExtraItem: const BlocStatus.success(),
              getCartState: PageState.loaded(
                  data: state.getCartState.data.copyWith(items: newItems)),
              deliveryPrice: right.deliveryPrice,
              couponValue: right.couponValue,
              totalPriceAfterDiscount: right.totalPriceAfterDiscount,
              totalPrice: right.totalPrice,
              priceAll: right.priceAll),
        );
        event.onSuccess.call();
      },
    );
  }

  Future<void> _onToggleItemCartEvent(
      ToggleItemCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(
        getCartState: PageState.loaded(
            data: CartModel(
                items: toggleItem(
                    state.getCartState.getDataWhenSuccess?.items ?? [],
                    event.id ?? "")))));
  }

  Future<void> _onAddToCartEvent(
      AddToCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(addToCart: const BlocStatus.loading()));
    final result = await addToCartCartUseCase(AddToCartParams(
        id: event.params.id,
        quantity: event.params.quantity,
        list: event.params.list ?? []));

    emit(state.copyWith(
        addToCart: HelperFunctions.mapEitherToBlocStatus(
            either: result, onSuccess: event.onSuccess)));
  }

  Future<void> _onRemoveItemEvent(
      RemoveItemEvent event, Emitter<CartState> emit) async {
    final originalState = state.getCartState;
    final newState = state.getCartState.data.copyWith(
        items: List.of(state.getCartState.data.items ?? [])
          ..removeWhere((item) => item.id == event.id));

    emit(state.copyWith(
        getCartState: (newState.items?.isEmpty ?? true)
            ? const PageState.empty()
            : PageState.loaded(data: newState),
        removeItem: const BlocStatus.loading()));
    final result = await removeItemUseCase(CartParams(
        addressId: state.addressId,
        code: state.code,
        storeId: event.storeId,
        id: event.id));

    result.fold(
      (error) {
        emit(state.copyWith(
          removeItem: BlocStatus.fail(error: error.message),
          getCartState: originalState,
        ));
        event.onFailure?.call();
      },
      (right) {
        emit(state.copyWith(
            removeItem: const BlocStatus.success(),
            deliveryPrice: right.deliveryPrice,
            couponValue: right.couponValue,
            totalPriceAfterDiscount: right.totalPriceAfterDiscount,
            totalPrice: right.totalPrice,
            priceAll: right.priceAll));
        event.onSuccess?.call();
      },
    );
  }

  Future<void> _onAddOrderEvent(
      AddOrderEvent event, Emitter<CartState> emit) async {
    if (isSendOrder) {
      emit(state.copyWith(addOrder: const BlocStatus.loading()));
      final result = await addOrderUseCase(AddOrderParams(
          storeId: event.storeId,
          code: state.code,
          addressId: state.addressId,
          notAvailable: 0,
          note: event.note));

      result.fold(
        (error) {
          event.onFailure?.call();
          emit(state.copyWith(addOrder: BlocStatus.fail(error: error.message)));
        },
        (success) {
          event.onSuccess?.call();
          emit(state.copyWith(addOrder: const BlocStatus.success()));
          emit(const CartState());
        },
      );
    } else {
      event.onFailure?.call();
      isSendOrder = true;
      showMessage(S.current.Something_went_wrong_please_try_again);
    }
  }

  Future<void> _onApplyCouponEvent(
      ApplyCouponEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(applyCoupon: const BlocStatus.loading()));
    final result = await applyCouponUseCase(CartParams(
        addressId: event.addressId ?? state.addressId,
        storeId: event.storeId,
        code: event.code ?? state.code));

    result.fold(
        (error) => emit(
            state.copyWith(applyCoupon: BlocStatus.fail(error: error.message))),
        (right) {
      emit(state.copyWith(
          applyCoupon: const BlocStatus.success(),
          deliveryPrice: right.deliveryPrice,
          couponValue: right.couponValue,
          totalPriceAfterDiscount: right.totalPriceAfterDiscount,
          totalPrice: right.totalPrice,
          priceAll: right.priceAll));
      event.onSuccess?.call();
      if (event.addressId != null) {
        emit(state.copyWith(addressId: event.addressId));
      }
      if (event.code != null) {
        emit(state.copyWith(code: event.code));
      }
    });
  }

  Future<void> _onGetAllCouponsEvent(
      GetAllCouponsEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(getAllCouponsState: const PageState.loading()));
    final result = await getAllCouponsUseCase.call(GetAllCouponsParams());

    emit(state.copyWith(
        getAllCouponsState: HelperFunctions.mapEitherToPageState(
      either: result,
      emptyChecker: (data) => (data.data ?? []).isEmpty,
    )));
  }

  Future<void> _onGetAllAddressEvent(
      GetAllAddressEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(getAllAddressState: const PageState.loading()));
    final result = await getAllAddressUseCase();

    emit(state.copyWith(
        getAllAddressState: HelperFunctions.mapEitherToPageState(
            either: result, emptyChecker: (data) => (data ?? []).isEmpty)));
  }
}

List<CartItemModel> toggleItem(List<CartItemModel> list, String id) {
  CartItemModel? item = list.firstWhereOrNull(
    (element) => element.productId == id,
  );
  if (item == null) {
    list = [
      ...list,
      ...[CartItemModel(productId: id)]
    ];
  } else {
    list.remove(item);
  }
  ;
  return list;
}
