import 'package:flutter/material.dart';

class Person extends StatefulWidget {
  const Person({super.key});

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 170,
            decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: ListTile(
              leading: CircleAvatar(
                radius: 40,
              ),
              title: Text(
                "Ali Abbas",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              subtitle: Text(
                "aliab7357@gmail.com",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(33)),
            padding: EdgeInsets.all(15),
            child: ListTile(
              title: Text("Rate the App"),
              trailing: Icon(Icons.star),
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
