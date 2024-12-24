import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/extra_item.dart';


part 'extra_item_state.dart';

class ExtraItemCubit extends Cubit<ExtraItemState> {
  ExtraItemCubit() : super(const ExtraItemState());

  void initExtraItems(List<ExtraItemModel> extraItems, isAllSelected) {

    List<ExtraItemModel> newExtraItems = List.of(extraItems);
    if (isAllSelected) {
      newExtraItems = newExtraItems.map((e) {
        emit(state.copyWith(
            totalPrice: state.totalPrice + e.price * e.quantity));
        return e.copyWith(selected: isAllSelected);
      }).toList();
    }
    emit(state.copyWith(extraItems: newExtraItems));
  }

  void updateQuantity({required bool isAdd, required String extraItemId}) {
    List<ExtraItemModel> newExtraItems = List.of(state.extraItems);

    newExtraItems = newExtraItems.map(
      (e) {
        if (e.id == extraItemId) {
          emit(state.copyWith(
              totalPrice: isAdd
                  ? state.totalPrice + e.price
                  : state.totalPrice - e.price));

          return e.copyWith(quantity: isAdd ? e.quantity + 1 : e.quantity - 1);
        } else {
          return e;
        }
      },
    ).toList();
    emit(state.copyWith(extraItems: newExtraItems));
  }

  void changeCheckBox({required String extraItemId}) {
    List<ExtraItemModel> newExtraItems = List.of(state.extraItems);

    newExtraItems = newExtraItems.map(
      (e) {
        if (e.id == extraItemId) {
          emit(state.copyWith(
              totalPrice: e.selected
                  ? state.totalPrice - e.price
                  : state.totalPrice + e.price));

          return e.copyWith(selected: !e.selected);
        } else {
          return e;
        }
      },
    ).toList();
    emit(state.copyWith(extraItems: newExtraItems));
  }
}
