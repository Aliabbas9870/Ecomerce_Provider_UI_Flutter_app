import 'package:ecommerce/model/category.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/views/widget/cart_product.dart';
import 'package:ecommerce/views/widget/custom_search.dart';
import 'package:ecommerce/views/widget/custome_app_bar.dart';
import 'package:ecommerce/views/widget/image_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
 }

class _HomeState extends State<Home> {
  int currentSlide = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategory = [all, shoe, trending, offer, local];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              CustomAppBar(),
              SizedBox(
                height: 12,
              ),
              CustomSearch(),
              SizedBox(
                height: 12,
              ),
              ImageSlider(
                  onchange: (val) {
                    setState(() {
                      currentSlide = val;
                    });
                  },
                  currentSlide: currentSlide),
              SizedBox(
                height: 12,
              ),
              // Category(),
    SizedBox(
      height: 130,
      child: ListView.builder(
          itemCount: category.length,
          // separatorBuilder: (context, index) => const SizedBox(
          //       width: 20,
          //     ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, ind) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = ind;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: selectedIndex == ind
                        ? Colors.orange
                        : Colors.transparent),
                padding: EdgeInsets.all(5),
                child: Column(children: [
                  Container(
                    height: 66,
                    width: 66,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(category[ind].img),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(height: 4),
                  Text(
                    category[ind].title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            );
          }),
    ),
 


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: selectedCategory[selectedIndex].length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 20,
                      crossAxisCount: 2),
                  itemBuilder: (context, ind) {
                    return CartProduct(
                        product: selectedCategory[selectedIndex][ind]);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
