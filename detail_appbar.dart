import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/provider/favourit_product.dart';
import 'package:flutter/material.dart';

class DetailAppbar extends StatefulWidget {
  final Product product;
  const DetailAppbar({super.key,required this.product});

  @override
  State<DetailAppbar> createState() => _DetailAppbarState();
}

class _DetailAppbarState extends State<DetailAppbar> {
  @override
  Widget build(BuildContext context) {
    final provider = FavouritProduct.of(context);
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
              style: IconButton.styleFrom(backgroundColor: (Colors.white70)),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          Spacer(),
          IconButton(
              style: IconButton.styleFrom(backgroundColor: (Colors.white70)),
              onPressed: () {},
              icon: Icon(Icons.share)),
          SizedBox(
            width: 12,
          ),
          IconButton(
              style: IconButton.styleFrom(backgroundColor: (Colors.white70)),
              onPressed: () {
                provider.toggleFav(widget.product);
              },
              icon: Icon( provider.isExist(widget.product)? Icons.favorite:Icons.favorite_border)),
        ],
      ),
    );
  }
}
