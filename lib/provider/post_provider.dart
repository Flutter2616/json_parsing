import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Postprovider extends ChangeNotifier
{
  List jsonlist=[];
  Future<void> post_jsonparsing()
  async {
    //1.jsonfile convert to String veriable
    String jsonstring=await rootBundle.loadString("assets/json/postjson.json");
    //2.string data convert to json data
    jsonlist=jsonDecode(jsonstring);
    notifyListeners();
  }
}