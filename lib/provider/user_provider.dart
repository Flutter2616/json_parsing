import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Userprovider extends ChangeNotifier
{
  List userlist=[];
  Future<void> User_jsonparsing()
  async {
    String userjson=await rootBundle.loadString("assets/json/userjson.json");
    userlist=jsonDecode(userjson);
    notifyListeners();
  }
}