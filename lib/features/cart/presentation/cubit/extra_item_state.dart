part of 'extra_item_cubit.dart';

@immutable
 class ExtraItemState {

  final List<ExtraItemModel> extraItems;
  final num totalPrice;

   const ExtraItemState({this.extraItems = const [],this.totalPrice=0});

  ExtraItemState copyWith({
   final  List<ExtraItemModel>? extraItems,
   final num? totalPrice

  }) {
   return ExtraItemState(
    extraItems: extraItems ?? this.extraItems,
    totalPrice: totalPrice ?? this.totalPrice,

   );
  }

}

