import'package:flutter/material.dart';
import 'package:json_parsing/provider/post_provider.dart';
import 'package:json_parsing/provider/user_provider.dart';
import 'package:json_parsing/view/home_screen.dart';
import 'package:json_parsing/view/post_screen.dart';
import 'package:json_parsing/view/user_data_screen.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Postprovider()),
        ChangeNotifierProvider(create: (context) => Userprovider()),
      ],
      child: MaterialApp(
        // initialRoute: 'user',
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => Homescreen(),
          'post':(context) => Postscreen(),
          'user':(context) => Userscreen(),
        },
      ),
    ),
  );
}