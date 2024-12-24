import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/common/models/page_state/page_state.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/features/app/presentation/pages/base.dart';
import 'package:restaurant_customer/features/auth/presentation/pages/Register_page.dart';
import 'package:restaurant_customer/features/cart/presentation/pages/mobile/cart_page_mobile.dart';
import '../../../../generated/flutter_gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../app/data/repositories/prefs_repository_impl.dart';
import '../../../app/presentation/widgets/app_appbar.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/app_text_field.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../cart/presentation/pages/cart_page.dart';
import '../../data/models/stores_section_model.dart';
import '../bloc/home_bloc.dart';
import 'badge-widget.dart';
import 'package:collection/collection.dart';

class AppBarWithCart extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final double ?toolbarHeight;
  final Color ?background;
  final  double height;
  final bool isHome;
  final List<StoresItem> ?listStore;
  AppBarWithCart({super.key,this.title="",this.toolbarHeight, this.listStore,this.background, this.isHome=false,  this.height=50});

  StoresItem ?selected;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return AppAppBar(
          showDefaultBackButton:!isHome,
          toolbarHeight: toolbarHeight,
          backgroundColor:background?? context.colorScheme.onPrimary,
          label:isHome?null: title,
          title:isHome?Row(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return DropdownButton(
                      value: listStore?.firstWhereOrNull((element) => element.id==state.storeSelected?.id,),
                      style: context.textTheme.bodySmall,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      underline: Container(),
                      items: listStore?.map<DropdownMenuItem<StoresItem>>((e) => DropdownMenuItem<StoresItem>(value: e, child: Text(e.name??"",)),).toList(),
                      onChanged: (value) {
                        context.read<HomeBloc>().add(SaveStoreEvent(storesItem: value!));
                      },
                    );
                  },
                ),
              ]
          ):Container(),
          actions: [
            Padding(
              padding: REdgeInsetsDirectional.only(end: 15),
              child: InkWell(onTap: () async {
                final token = await StorageRepositoryImpl().token;
                token!=null? context.pushNamed(CartPage.name):context.go(RegisterPage.path);
              }, child:BadgeWidget(
                  showBadge: (state.getCartState.getDataWhenSuccess?.items?.length??0) != 0,
                  badgeContent:(state.getCartState.getDataWhenSuccess?.items?.length??0) != 0
                      ? AppText("${state.getCartState.getDataWhenSuccess?.items?.length }").copyWith(color: context.colorScheme.onPrimary)
                      : null,
                  child: AppImage.asset(Assets.icons.shoppingCart))),
            )
          ],
          bottom:isHome? PreferredSize(preferredSize: const Size(200, 100), child: Padding(
            padding: const EdgeInsets.only(right: 17,left: 17),
            child: Column(
              children: [
                AppText(S.current.title_home,
                  style:context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700) ,textAlign: TextAlign.end,),
                10.verticalSpace,
                AppTextFormField(
                  fillColor: context.colorScheme.onPrimary,
                  prefixIcon: const Icon(Icons.search,color: Colors.black,),

                )
              ],
            ),
          )):PreferredSize(preferredSize: const Size(0, 0),child: Container() ,),
        );
      },
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(height);
}
