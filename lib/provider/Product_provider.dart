import 'package:flutter/cupertino.dart';
import 'package:json_parsing/model/cart_model.dart';
import 'package:json_parsing/utils/product_api.dart';
import 'package:json_parsing/model/product_model.dart';

class Productprovider extends ChangeNotifier
{

 Future<List<Productmodel>> productjson()
   async {
   return await Api_helper.api_helper.productapi();
    notifyListeners();
  }
}