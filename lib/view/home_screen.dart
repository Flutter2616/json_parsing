import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, 'post');
              }, child: Text("Post data")),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, 'user');
              }, child: Text("user data")),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, 'cart');
              }, child: Text("cart")),
            ],
          ),
        ),
      ),
    );
  }
}
