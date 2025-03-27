import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final Function(int) onchange;
  final int currentSlide;
  const ImageSlider(
      {super.key, required this.onchange, required this.currentSlide});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 222,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: PageView(
              onPageChanged: onchange,
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              physics: ClampingScrollPhysics(),
              children: [
                Image.asset(
                  "assets/images/slide1.jpg",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "assets/images/slide2.jpg",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "assets/images/slide3.jpg",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "assets/images/slide4.jpg",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "assets/images/slide5.jpg",
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10,
            child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (i) => AnimatedContainer(
                duration: Duration(seconds: 2),
                width: currentSlide == i ? 15 : 8,
                height: 8,
                margin: EdgeInsets.only(right: 3),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color: currentSlide==i?Colors.orange:Colors.transparent,
                    border: Border.all(color: Colors.black)
                    ),
              ),
            ),
          ),
        ))
      ],
    );
  }
}
