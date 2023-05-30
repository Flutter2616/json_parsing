import 'package:flutter/material.dart';
import 'package:json_parsing/provider/add_product_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Addproductscreen extends StatefulWidget {
  const Addproductscreen({Key? key}) : super(key: key);

  @override
  State<Addproductscreen> createState() => _AddproductscreenState();
}

class _AddproductscreenState extends State<Addproductscreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtcategory = TextEditingController();
  TextEditingController txtoffer = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtdesc = TextEditingController();
  TextEditingController txtrate = TextEditingController();
  Addprovider? af;
  Addprovider? at;

  @override
  Widget build(BuildContext context) {
    af = Provider.of<Addprovider>(context, listen: false);
    at = Provider.of<Addprovider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Add product"), centerTitle: true),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                textbar("Product Name", txtname),
                textbar("Product Price", txtprice),
                textbar("Product Category", txtcategory),
                textbar("Product Offer", txtoffer),
                textbar("Product Rate", txtrate),
                textbar("Product Description", txtdesc),
                ElevatedButton(
                    onPressed: () async {
                      String msg = await af!.add_product(
                          txtname.text,
                          txtprice.text,
                          txtoffer.text,
                          txtcategory.text,
                          txtrate.text,
                          txtdesc.text);

                      af!.cleartextfield(txtname, txtprice, txtoffer,
                          txtcategory, txtrate, txtdesc);

                      print('============${msg}=================');

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        "${msg}",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )));
                    },
                    child: Text("Add product"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textbar(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: "$hint",
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2))),
      ),
    );
  }
}
