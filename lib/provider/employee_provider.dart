import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:json_parsing/model/employee_model.dart';

class Employeeprovider extends ChangeNotifier
{
  Map employeelist= {};
  Employeemodel? employee;
  Future<void> json_to_simple()
  async {
    String jsonstring=await rootBundle.loadString("assets/json/employee.json");
     employeelist=jsonDecode(jsonstring);
     employee=Employeemodel.fromjson(employeelist);
     // print(employee!.employeedatalist!.length);
     notifyListeners();
  }
}