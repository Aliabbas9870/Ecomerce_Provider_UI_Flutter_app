import 'package:ecommerce/provider/favourit_product.dart';
import 'package:flutter/material.dart';

class Favourit extends StatefulWidget {
  const Favourit({super.key});

  @override
  State<Favourit> createState() => _FavouritState();
}

class _FavouritState extends State<Favourit> {
  @override
  Widget build(BuildContext context) {
    final provider = FavouritProduct.of(context);
    final favitem = provider.favourit;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Favourits",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: favitem.length,
            itemBuilder: (context, index) {
              final favouritItem = favitem[index];
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 85,
                              height: 86,
                              padding: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Image.asset(favouritItem.img),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  favouritItem.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  favouritItem.category,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.grey.shade400),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "\$${favouritItem.price}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 40,
                      right: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                favitem.removeAt(index);
                                setState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Item Removed Successfully!")));
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          
                        ],
                      ))
                ],
              );
            },
          ))
        ],
      ),
    );
  }
}
