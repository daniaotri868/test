import 'package:restaurant_customer/features/home/data/models/stores_section_model.dart';

import 'banner_section_model.dart';
import 'category_section_model.dart';
import 'last_product_section_model.dart';

class HomeModel {
  final Banners? banners;
  final Categories? categories;
  final LastItems? lastItems;
  final LastItems? offers;
  final List<StoresItem>? stores;
  final int? cartCount;
  final int? unReadNotificationCount;
  final StoresItem? minDistanceStore;

  HomeModel({
    this.banners,
    this.categories,
    this.lastItems,
    this.offers,
    this.stores,
    this.cartCount,
    this.unReadNotificationCount,
    this.minDistanceStore,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        banners: Banners.fromJson(json["banners"]),
        minDistanceStore: StoresItem.fromJson(json["minDistanceStore"] ?? {}),
        categories: Categories.fromJson(json["categories"]),
        lastItems: LastItems.fromJson(json["lastItems"]),
        offers: LastItems.fromJson(json["offers"]),
        stores: List<StoresItem>.from(
            json["stores"].map((x) => StoresItem.fromJson(x))),
        cartCount: json["cartCount"],
        unReadNotificationCount: json["unReadNotificationCount"],
      );

  Map<String, dynamic> toJson() => {
        "banners": banners?.toJson(),
        "categories": categories?.toJson(),
        "lastItems": lastItems?.toJson(),
        "offers": offers?.toJson(),
        "stores": List<dynamic>.from((stores ?? []).map((x) => x.toJson())),
        "cartCount": cartCount,
        "unReadNotificationCount": unReadNotificationCount,
        "minDistanceStore": minDistanceStore?.toJson()
      };
  HomeModel copyWith({
    Banners? banners,
    Categories? categories,
    LastItems? lastItems,
    LastItems? offers,
    List<StoresItem>? stores,
    int? cartCount,
    int? unReadNotificationCount,
    StoresItem? minDistanceStore,
  }) {
    return HomeModel(
      banners: banners ?? this.banners,
      categories: categories ?? this.categories,
      lastItems: lastItems ?? this.lastItems,
      offers: offers ?? this.offers,
      stores: stores ?? this.stores,
      cartCount: cartCount ?? this.cartCount,
      unReadNotificationCount:
          unReadNotificationCount ?? this.unReadNotificationCount,
      minDistanceStore: minDistanceStore ?? this.minDistanceStore,
    );
  }
}
