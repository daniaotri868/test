
part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}


class GetProductDetailsEvent extends CategoryEvent {
  final String id;

  GetProductDetailsEvent({required this.id});
}

class ChangeSelectedExtraItemEvent extends CategoryEvent {
  final List<ExtraItemModel> ?list;

  ChangeSelectedExtraItemEvent({required this.list});
}

class SaveIdCategoryEvent extends CategoryEvent {
  final String id;

  SaveIdCategoryEvent({required this.id});
}
class GetAllCategoryEvent extends CategoryEvent {
  GetAllCategoryEvent();
}


class GetProductByCategoryEvent extends CategoryEvent {
  final int pageKey;
  GetProductByCategoryEvent({required this.pageKey});
}

