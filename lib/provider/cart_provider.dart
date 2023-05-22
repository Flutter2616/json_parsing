import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:json_parsing/model/cart_model.dart';

class Cartprovider extends ChangeNotifier
{
  List<Cartmodel> cartlist=[];
  Future<void> cart_jsondata()
  async {
    String cartjson=await rootBundle.loadString("assets/json/cartjson.json");
    List userjsonlist=jsonDecode(cartjson);
    cartlist=userjsonlist.map((e) => Cartmodel.fromjson(e)).toList();
    // print(cartlist.length);
    notifyListeners();
  }
}