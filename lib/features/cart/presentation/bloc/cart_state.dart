part of 'cart_bloc.dart';

@immutable
class CartState {
  final Duration durations;
  final int sequentialEventsCount;
  final num? totalPrice;
  final num? totalPriceAfterDiscount;
  final num? deliveryPrice;
  final num? couponValue;
  final num? priceAll;
  final String? code;
  final String? addressId;

  final PageState<CartModel> getCartState;
  final PageState<List<AddressModel>> getAllAddressState;
  final PageState<PaginationModel<CouponModel>> getAllCouponsState;
  final BlocStatus removeItem;
  final BlocStatus removeExtraItem;
  final BlocStatus addToCart;
  final BlocStatus addOrder;
  final BlocStatus updateCart;
  final BlocStatus applyCoupon;
  final BlocStatus updateExtraItem;

  const CartState({
    this.sequentialEventsCount = 0,
    this.durations = const Duration(seconds: 0),
    this.totalPrice,
    this.totalPriceAfterDiscount,
    this.deliveryPrice,
    this.couponValue,
    this.priceAll,
    this.code,
    this.addressId,
    this.updateExtraItem = const BlocStatus.initial(),
    this.applyCoupon = const BlocStatus.initial(),
    this.updateCart = const BlocStatus.initial(),
    this.addToCart = const BlocStatus.initial(),
    this.addOrder = const BlocStatus.initial(),
    this.removeItem = const BlocStatus.initial(),
    this.removeExtraItem = const BlocStatus.initial(),
    this.getAllAddressState = const PageState.init(),
    this.getAllCouponsState = const PageState.init(),
    this.getCartState = const PageState.init(),
  });

  CartState copyWith({
    final int? sequentialEventsCount,
    final Duration? durations,
    final num? totalPrice,
    final num? totalPriceAfterDiscount,
    final num? deliveryPrice,
    final num? couponValue,
    final num? priceAll,
    final String? code,
    final String? addressId,
    final BlocStatus? addToCart,
    final BlocStatus? addOrder,
    final BlocStatus? removeItem,
    final BlocStatus? applyCoupon,
    final BlocStatus? updateCart,
    final BlocStatus? updateExtraItem,
    final PageState<CartModel>? getCartState,
    final PageState<List<AddressModel>>? getAllAddressState,
    final PageState<PaginationModel<CouponModel>>? getAllCouponsState,
  }) {
    return CartState(
      durations: durations ?? this.durations,
      sequentialEventsCount:
          sequentialEventsCount ?? this.sequentialEventsCount,
      addressId: addressId ?? this.addressId,
      code: code ?? this.code,
      priceAll: priceAll ?? this.priceAll,
      couponValue: couponValue ?? this.couponValue,
      deliveryPrice: deliveryPrice ?? this.deliveryPrice,
      totalPriceAfterDiscount:
          totalPriceAfterDiscount ?? this.totalPriceAfterDiscount,
      totalPrice: totalPrice ?? this.totalPrice,
      addToCart: addToCart ?? this.addToCart,
      addOrder: addOrder ?? this.addOrder,
      removeItem: removeItem ?? this.removeItem,
      updateCart: updateCart ?? this.updateCart,
      applyCoupon: applyCoupon ?? this.applyCoupon,
      updateExtraItem: updateExtraItem ?? this.updateExtraItem,
      getCartState: getCartState ?? this.getCartState,
      getAllAddressState: getAllAddressState ?? this.getAllAddressState,
      getAllCouponsState: getAllCouponsState ?? this.getAllCouponsState,
    );
  }
}
