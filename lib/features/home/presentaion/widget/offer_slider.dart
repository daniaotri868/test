import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../data/models/banner_section_model.dart';

class OfferSlider extends StatelessWidget {
  final List<BannerItem> listBanner;

  const OfferSlider({super.key, required this.listBanner});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsetsDirectional.only(top: 17, end: 25, bottom: 16.h),
      child: listBanner.isEmpty
          ? SizedBox(
              height: 200.h,
              child: Center(
                child: AppText(S.current.notFoundOffer)
                    .copyWith(color: context.colorScheme.primary),
              ),
            )
          : CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1),
              items: listBanner
                  .map((e) => InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: BoxDecoration(
                                color: context.colorScheme.onPrimary,
                                borderRadius: BorderRadius.circular(10.r)),
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: AspectRatio(
                                  aspectRatio: 2 / 1,
                                  child: FancyShimmerImage(
                                    errorWidget: const Center(
                                      child: Icon(
                                        Icons.image_not_supported,
                                        size: 30,
                                      ),
                                    ),
                                    imageUrl: e.image ?? "",
                                  ),
                                ))),
                      ))
                  .toList(),
            ),
    );
  }
}
