import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/provider/favourit_product.dart';
import 'package:ecommerce/views/widget/detail.dart';
import 'package:flutter/material.dart';

class CartProduct extends StatelessWidget {
  final Product product;
  const CartProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavouritProduct.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detail(
                      product: product,
                    )));
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Hero(
                    tag: product.img,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        product.img,
                        width: 160,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text(
                    product.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      " \$${product.price}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
          ),

          // for favi
          Positioned(
              child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      bottomLeft: Radius.circular(10))),
              child: GestureDetector(
                onTap: () {
                  provider.toggleFav(product);
                },
                child: Icon(
                  provider.isExist(product)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  size: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
