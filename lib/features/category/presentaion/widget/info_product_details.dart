import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/features/category/presentaion/bloc/category_bloc.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/animated_dialog.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../cart/presentation/widgets/data_extra_item.dart';
import '../../data/models/details_product_model.dart';

class InfoProductDetails extends StatelessWidget {
  final DetailsProductModel data;
  final CategoryBloc ?categoryBloc;
  const InfoProductDetails({super.key, required this.data, this.categoryBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.displayMedium(data.name??"",textDirection: TextDirection.rtl,),
        7.verticalSpace,
        AppText.bodyLarge((data.price??0).toString()).copyWith(color: const Color(0xff00810B)),
        7.verticalSpace,
        AppText.bodyLarge("${data.unit} ${data.unitValue}"),
        7.verticalSpace,
        Row(
          children: [
            const AppImage.asset(Assets.iconsError,width: 15,height: 15,),
            10.horizontalSpace,
            AppText((data.preparingTime??0).toString()),
            27.horizontalSpace,
            const AppImage.asset(Assets.iconsError,width: 15,height: 15,),
            10.horizontalSpace,
            AppText(data.categoryName??""),
          ],
        ),
        7.verticalSpace,
        AppText.bodySmall(data.description??"",maxLines: 6,overflow:TextOverflow.ellipsis,),
        10.verticalSpace,
        (data.extraItem??[]).isEmpty?const SizedBox.shrink():(data.extraItem??[]).any((element) => element.selected==true,)?
        Row(
          children: [
            const Icon(Icons.check),
            AppText.bodySmall(S.current.selected),
            TextButton(onPressed: () {
              AnimatedDialog.show(
                context,
                child: DataExtraItem(extraItemList:data.extraItem??[],onPressed: (p0) {
                  categoryBloc?.add(ChangeSelectedExtraItemEvent(list: p0));
                },),
              );
            }, child: AppText.bodySmall(S.current.More,style: TextStyle(decoration: TextDecoration.underline),))
          ],
        ):TextButton.icon(
          onPressed: () {
            AnimatedDialog.show(
              context,
              child:  DataExtraItem(extraItemList:data.extraItem??[],onPressed: (p0) {
                categoryBloc?.add(ChangeSelectedExtraItemEvent(list: p0));
              },),
            );

          }, label: AppText.bodyMedium(S.current.add_extra_item),
          icon: const Icon(Icons.add,size: 22,),
        )
      ],
    );
  }
}
