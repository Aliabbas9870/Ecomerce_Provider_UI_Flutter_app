import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/views/widget/add_to_cart.dart';
import 'package:ecommerce/views/widget/description.dart';
import 'package:ecommerce/views/widget/detail_appbar.dart';
import 'package:ecommerce/views/widget/image_slider_detail.dart';
import 'package:ecommerce/views/widget/item_details.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final Product product;
  const Detail({super.key, required this.product});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int currentImg = 0;
  // int currentImg=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
          child: Column(
        children: [
          DetailAppbar(
            product: widget.product,
          ),
          ImageSliderDetail(
              onChanged: (ind) {
                setState(() {
                  currentImg = ind;
                });
              },
              image: widget.product.img),
          SizedBox(
            height: 9,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (i) => AnimatedContainer(
                duration: Duration(seconds: 2),
                width: currentImg == i ? 15 : 8,
                height: 8,
                margin: EdgeInsets.only(right: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentImg == i ? Colors.orange : Colors.transparent,
                    border: Border.all(color: Colors.black)),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(right: 12, left: 12, bottom: 100, top: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(22),
                    topLeft: Radius.circular(22))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemDetails(product: widget.product),
                SizedBox(
                  height: 25,
                ),
                Description(description: widget.product.description),
                SizedBox(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
