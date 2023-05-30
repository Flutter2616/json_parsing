import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_parsing/utils/product_api.dart';

class Addprovider extends ChangeNotifier {
  String msg = '';

  Future<String> add_product(name, price, offer, category, rate, desc) async {
    msg = await Api_helper.api_helper
        .add_product_api(name, price, offer, category, rate, desc);
   return msg;
  }

  void cleartextfield(
      TextEditingController txtname,
      TextEditingController txtprice,
      TextEditingController txtoffer,
      TextEditingController txtcategory,
      TextEditingController txtrate,
      TextEditingController txtdesc) {
    txtdesc.clear();
    txtrate.clear();
    txtcategory.clear();
    txtoffer.clear();
    txtprice.clear();
    txtname.clear();
    notifyListeners();
  }
}
