import'package:flutter/material.dart';
import 'package:json_parsing/provider/Product_provider.dart';
import 'package:json_parsing/provider/add_product_provider.dart';
import 'package:json_parsing/provider/cart_provider.dart';
import 'package:json_parsing/provider/employee_provider.dart';
import 'package:json_parsing/provider/post_provider.dart';
import 'package:json_parsing/provider/user_provider.dart';
import 'package:json_parsing/view/add_product_screen.dart';
import 'package:json_parsing/view/cart_screen.dart';
import 'package:json_parsing/view/employee_screen.dart';
import 'package:json_parsing/view/home_screen.dart';
import 'package:json_parsing/view/post_screen.dart';
import 'package:json_parsing/view/product_screen.dart';
import 'package:json_parsing/view/user_data_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
void main()
{
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Postprovider()),
          ChangeNotifierProvider(create: (context) => Userprovider()),
          ChangeNotifierProvider(create: (context) => Cartprovider()),
          ChangeNotifierProvider(create: (context) => Employeeprovider()),
          ChangeNotifierProvider(create: (context) => Productprovider()),
          ChangeNotifierProvider(create: (context) => Addprovider()),
        ],
        child: MaterialApp(
          initialRoute: 'add',
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context) => Homescreen(),
            'post':(context) => Postscreen(),
            'user':(context) => Userscreen(),
            'cart':(context) => Cartscreen(),
            'employee':(context) => Employeescreen(),
            'product':(context) => Productscreen(),
            'add':(context) => Addproductscreen(),
          },
        ),
      );
    },
    ),
  );
}