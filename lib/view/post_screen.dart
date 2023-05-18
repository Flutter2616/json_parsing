import 'package:flutter/material.dart';
import 'package:json_parsing/provider/post_provider.dart';
import 'package:provider/provider.dart';

class Postscreen extends StatefulWidget {
  const Postscreen({Key? key}) : super(key: key);

  @override
  State<Postscreen> createState() => _PostscreenState();
}

class _PostscreenState extends State<Postscreen> {
  Postprovider? pf;
  Postprovider? pt;
  @override
  void initState() {
    super.initState();
    Provider.of<Postprovider>(context,listen: false).post_jsonparsing();
  }
  Widget build(BuildContext context) {
    pf = Provider.of<Postprovider>(context, listen: false);
    pt = Provider.of<Postprovider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("Json Data",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500)),
            elevation: 0,centerTitle: true),
        body: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ExpansionTile(
                  backgroundColor: Colors.white,
                  title: Text(" ID : ${pf!.jsonlist[index]['id']}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black)),
                  children: [
                    Text("title: ${pf!.jsonlist[index]['title']}",
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    SizedBox(height: 10),
                    Text("body: ${pf!.jsonlist[index]['body']}",
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
              );
            },
            itemCount: pt!.jsonlist.length),
      ),
    );
  }
}
