import 'package:flutter/material.dart';
import 'package:json_parsing/provider/employee_provider.dart';
import 'package:provider/provider.dart';

class Employeescreen extends StatefulWidget {
  const Employeescreen({Key? key}) : super(key: key);

  @override
  State<Employeescreen> createState() => _EmployeescreenState();
}

class _EmployeescreenState extends State<Employeescreen> {
  Employeeprovider? ef;
  Employeeprovider? et;

  @override
  void initState() {
    Provider.of<Employeeprovider>(context, listen: false).json_to_simple();
    super.initState();
  }

  Widget build(BuildContext context) {
    ef = Provider.of<Employeeprovider>(context, listen: false);
    et = Provider.of<Employeeprovider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            title: Text("Success Employee list",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w500)),
            backgroundColor: Colors.white),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Expanded(
                  child: ListView.builder(
                itemCount: et!.employee!.employeedatalist!.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "id :${ef!.employee!.employeedatalist![index].id}"),
                        Text(
                            "Employee_name :${ef!.employee!.employeedatalist![index].employee_name}"),
                        Text(
                            "Employee_age :${ef!.employee!.employeedatalist![index].employee_age}"),
                        Text(
                            "Employee_salary :${ef!.employee!.employeedatalist![index].employee_salary}"),
                      ],
                    ),
                  );
                },
              )),
              SizedBox(height: 10),
              Text("Successfully! All records has been fetched.",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 25)),
            ],
          ),
        ),
      ),
    );
  }
}
