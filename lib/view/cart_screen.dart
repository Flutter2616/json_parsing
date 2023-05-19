import 'package:flutter/material.dart';
import 'package:json_parsing/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({Key? key}) : super(key: key);

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  Cartprovider? ct;
  Cartprovider? cf;

  @override
  void initState() {
    Provider.of<Cartprovider>(context,listen: false).cart_jsondata();
    super.initState();
  }
  Widget build(BuildContext context) {
    cf = Provider.of<Cartprovider>(context, listen: false);
    ct = Provider.of<Cartprovider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("id : ${cf!.cartlist[index].id}"),
                    SizedBox(height: 5),
                    Text("user id: ${cf!.cartlist[index].userid}"),
                    SizedBox(height: 5),
                    Text("date : ${cf!.cartlist[index].date}"),
                    SizedBox(height: 5),
                    Text("v : ${cf!.cartlist[index].v}"),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text("productid : ${cf!.cartlist[index].productmodel![0].productid}"),
                        SizedBox(width: 10),
                        Text("quntity : ${cf!.cartlist[index].productmodel![0].quntity}"),
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: ct!.cartlist.length),
      ),
    );
  }
}
