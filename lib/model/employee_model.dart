class Employeemodel {
  String? message, status;
  List<Datamodel>? employeedatalist;

  Employeemodel({this.message, this.status,this.employeedatalist});

  factory Employeemodel.fromjson(Map m) {
    List<Datamodel> datalist=[];
    List datamaplist=m['data'];
    datalist=datamaplist.map((e) => Datamodel.fromdata(e)).toList();
    return Employeemodel(message: m['message'], status: m['status'],employeedatalist: datalist);
  }
}

class Datamodel {
  String? employee_name;

  int? id, employee_salary, employee_age;

  Datamodel(
      {this.employee_name, this.employee_salary, this.employee_age, this.id});

  factory Datamodel.fromdata(Map m1) {
    return Datamodel(
        id: m1['id'],
        employee_age: m1['employee_age'],
        employee_name: m1['employee_name'],
        employee_salary: m1['employee_salary']);
  }
}
