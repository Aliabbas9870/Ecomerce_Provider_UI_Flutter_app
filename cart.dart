import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/views/widget/check_out.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final FinalList = provider.cart;
    prouctQunty(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add ? provider.incQnt(index) : provider.decQnt(index);
          });
        },
        child: Icon(icon),
      );
    }

    return Scaffold(
      bottomSheet:const CheckOut(),
      body: SafeArea(
          child:  Column(
        children: [
          Padding(
            padding: EdgeInsets.all(9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const  Text(
                  "My Cart",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Container()
              ],
            ),
          ),
        Expanded(
              child: ListView.builder(
            itemCount: FinalList.length,
            itemBuilder: (context, index) {
              final finalItem = FinalList[index];
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
                              width: 100,
                              height: 120,
                              padding: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Image.asset(finalItem.img),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  finalItem.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  finalItem.category,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.grey.shade400),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "\$${finalItem.price}",
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
                      top: 35,
                      right: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                FinalList.removeAt(index);
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
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.grey.shade100)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                prouctQunty(Icons.add, index),
                                Text(finalItem.quenty.toString()),
                                SizedBox(
                                  width: 5,
                                ),
                                prouctQunty(Icons.remove, index),
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              );
            },
          ))
        
        
        ],
      )),
    );
  }
}
