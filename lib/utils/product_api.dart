import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_parsing/model/cart_model.dart';
import 'package:json_parsing/model/product_model.dart';

class Api_helper {
  static Api_helper api_helper = Api_helper();

  Future<List<Productmodel>> productapi() async {
    String link = "https://fakestoreapi.com/products";

    var response = await http.get(Uri.parse(link));

    List jsonlist = [];
    jsonlist = jsonDecode(response.body);

    List<Productmodel> product =
        jsonlist.map((e) => Productmodel.fromjson(e)).toList();
    return product;
  }

  Future<String> add_product_api(String name, String price, String offer,
      String category, String rate, String desc) async {
    String link =
        'https://apidatahub.000webhostapp.com/MyShop/API/adddataapi.php';
    var response = await http.post(Uri.parse(link), body: {
      'p_name': name,
      'p_price': price,
      'p_offer': offer,
      'p_category': category,
      'p_rate': rate,
      'p_desc': desc
    });

    var json = jsonDecode(response.body);

    if (json[0]['status'] == 'ok') {
      return 'success';
    } else {
      return 'failed';
    }
  }
}
