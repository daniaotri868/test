import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../app/presentation/widgets/fancy_image_shimmer_viewer.dart';

class ImageProductDetails extends StatelessWidget {
  final String image;
  const ImageProductDetails({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child:  FancyImageShimmerViewer(
              width: double.infinity,
              fit: BoxFit.cover,
              imageUrl:image),
        ),

      ],
    );
  }
}
