import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 54,
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 34,
            color: Colors.grey,
          ),
          Flexible(
              flex: 4,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search...", border: InputBorder.none),
              )),
          Container(
            width: 1.5,
            height: 25,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.tune,
                color: Colors.grey,  
              ))
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(8)),
    );
  }
}
