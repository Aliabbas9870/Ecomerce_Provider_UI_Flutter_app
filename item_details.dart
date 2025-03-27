import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final Product product;
  const ItemDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$${product.price}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Container(
              height: 23,
              width: 66,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12)),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 17,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    product.rate.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Text(
              product.review,
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
        
            Spacer(),
            Text.rich(
              
            TextSpan(children: [
              TextSpan(text: "Seller:", style: TextStyle(fontSize: 16)),
              TextSpan(text: product.seller, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
            ])
              
              )
          ],
        ),
      ],
    );
  }
}
