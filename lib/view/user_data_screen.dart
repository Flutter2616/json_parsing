import 'package:flutter/material.dart';
import 'package:json_parsing/provider/user_provider.dart';
import 'package:provider/provider.dart';

class Userscreen extends StatefulWidget {
  const Userscreen({Key? key}) : super(key: key);

  @override
  State<Userscreen> createState() => _UserscreenState();
}

class _UserscreenState extends State<Userscreen> {
  Userprovider? uf;
  Userprovider? ut;

  @override
  void initState() {
    super.initState();
    Provider.of<Userprovider>(context, listen: false).User_jsonparsing();
  }

  Widget build(BuildContext context) {
    uf = Provider.of<Userprovider>(context, listen: false);
    ut = Provider.of<Userprovider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("User Data",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500)),
            elevation: 0,
            centerTitle: true),
        body: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ExpansionTile(
                  collapsedBackgroundColor: Colors.grey.shade100,expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                  backgroundColor: Colors.white,
                  title: Text("${uf!.userlist[index]['name']}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black)),
                  leading: Text(" id : ${uf!.userlist[index]['id']}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black)),
                  children: [
                    Text(" Phone : ${uf!.userlist[index]['phone']}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black)),
                    Text("Email :${uf!.userlist[index]['email']}",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500)),
                    Text("City :${uf!.userlist[index]['address']['city']}",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500)),
                    Text("Zip code :${uf!.userlist[index]['address']['zipcode']}",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500)),
                    Text("Web Site:${uf!.userlist[index]['website']}",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500)),
                    Text("Company:${uf!.userlist[index]['company']['name']}",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500)),
                  ],tilePadding: EdgeInsets.symmetric(horizontal: 8),
                ),
              );
            },
            itemCount: uf!.userlist.length),
      ),
    );
  }
}
