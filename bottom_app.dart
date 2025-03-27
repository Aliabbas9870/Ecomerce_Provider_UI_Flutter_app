import 'package:ecommerce/views/cart.dart';
import 'package:ecommerce/views/favourit.dart';
import 'package:ecommerce/views/home.dart';
import 'package:ecommerce/views/person.dart';
import 'package:flutter/material.dart';

class BottomApp extends StatefulWidget {
  const BottomApp({super.key});

  @override
  State<BottomApp> createState() => _BottomAppState();
}

class _BottomAppState extends State<BottomApp> {
  int currentIndex = 2;

  List screen = [
    Scaffold(),
    Favourit(),
    Home(),
    Cart(),
    Person(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 18,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                icon: Icon(Icons.grid_view_outlined,
                    size: 28,
                    color: currentIndex == 0 ? Colors.orange : Colors.grey)),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: Icon(Icons.favorite_border_outlined,
                    size: 28,
                    color: currentIndex == 1 ? Colors.orange : Colors.grey)),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                icon: Icon(Icons.shopping_cart_outlined,
                    size: 28,
                    color: currentIndex == 3 ? Colors.orange : Colors.grey)),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 4;
                  });
                },
                icon: Icon(Icons.person,
                    size: 28,
                    color: currentIndex == 4 ? Colors.orange : Colors.grey)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        child: Icon(
          Icons.home,
          size: 34,
          color: Colors.white,
        ),
        shape: CircleBorder(),
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
