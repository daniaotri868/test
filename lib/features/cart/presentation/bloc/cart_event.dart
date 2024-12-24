part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class GetCartEvent extends CartEvent {
  final String? storeId;

  GetCartEvent({this.storeId});
}

class RemoveItemEvent extends CartEvent {
  final VoidCallback? onSuccess;
  final VoidCallback? onFailure;
  final String? id;
  final String? storeId;
  final bool? isAddSequential;

  RemoveItemEvent(
      {this.onSuccess,
        this.onFailure,
        required this.id,
        required this.storeId,
        required this.isAddSequential});

  RemoveItemEvent copyWith(
      {final VoidCallback? onSuccess,
        final VoidCallback? onFailure,
        final String? id,
        final String? storeId,
        final bool? isAddSequential}) {
    return RemoveItemEvent(
      onSuccess: onSuccess ?? this.onSuccess,
      onFailure: onFailure ?? this.onFailure,
      id: id ?? this.id,
      storeId: storeId ?? this.storeId,
      isAddSequential: isAddSequential ?? this.isAddSequential,
    );
  }
}

class ApplyCouponEvent extends CartEvent {
  final VoidCallback? onSuccess;
  final String? code;
  final String? storeId;
  final String? addressId;

  ApplyCouponEvent(
      { this.storeId, this.addressId, this.code, this.onSuccess});
}

class UpdateCartEvent extends CartEvent {
  final VoidCallback? onSuccess;
  final VoidCallback? onFailure;
  final String? id;

  final String? storeId;

  UpdateCartEvent({required this.id, required this.storeId, this.onSuccess,this.onFailure});

  UpdateCartEvent copyWith(
      {final VoidCallback? onSuccess,
        final VoidCallback? onFailure,
        final String? id,
        final String? storeId,
        final bool? isAddSequential}) {
    return UpdateCartEvent(
      onSuccess: onSuccess ?? this.onSuccess,
      onFailure: onFailure ?? this.onFailure,

      id: id ?? this.id,
      storeId: storeId ?? this.storeId,
    );
  }}

class UpdateCartLocalEvent extends CartEvent {
  final String? itemId;
  final bool isIncrement;
  final bool? isAddSequential;

  UpdateCartLocalEvent(
      {this.itemId, required this.isIncrement, required this.isAddSequential});
}

class UpdateExtraItemEvent extends CartEvent {
  final VoidCallback onSuccess;
  final String cartId;
  final String? storeId;
  final List<ExtraItemModel> extraItems;

  UpdateExtraItemEvent(
      {required this.cartId,
        required this.extraItems,
        this.storeId,
        required this.onSuccess});
}

class GetAllCouponsEvent extends CartEvent {
  GetAllCouponsEvent();
}

class GetAllAddressEvent extends CartEvent {
  GetAllAddressEvent();
}



class AddOrderEvent extends CartEvent {
  final VoidCallback? onSuccess;
  final VoidCallback? onFailure;

  final String? note;
  final String? storeId;
  final int? notAvailable;

  AddOrderEvent({this.note, this.storeId, this.notAvailable, this.onSuccess,this.onFailure});
}

class AddToCartEvent extends CartEvent {
AddToCartParams params;
final VoidCallback ?onSuccess;


AddToCartEvent({this.onSuccess, required this.params});
}
class ToggleItemCartEvent extends CartEvent {
  final String ?id;


  ToggleItemCartEvent({this.id,});
}
