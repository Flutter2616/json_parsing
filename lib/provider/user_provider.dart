import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:json_parsing/model/user_model.dart';

class Userprovider extends ChangeNotifier
{
  List jsonlist=[];
  List<Usermodel> userlist=[];
  Future<void> User_jsonparsing()
  async {
    String userjson=await rootBundle.loadString("assets/json/userjson.json");
    jsonlist=jsonDecode(userjson);

    userlist=jsonlist.map((e) => Usermodel.fromjson(e)).toList();

    notifyListeners();
  }
}