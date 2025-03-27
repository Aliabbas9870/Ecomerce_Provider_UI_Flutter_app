import 'package:flutter/material.dart';

class ImageSliderDetail extends StatelessWidget {
  final Function(int) onChanged;
  final String image;
  const ImageSliderDetail(
      {super.key, required this.onChanged, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
          onPageChanged: onChanged,
          itemBuilder: (context, ind) {
            return Hero(tag: image, child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(image)));
          }),
    );
  }
}
