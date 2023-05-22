class Cartmodel {
  String? date;
  int? id, userid, v;
  List<dynamic>? product;
  List<Productmodel>? productmodel;



  Cartmodel(
      {this.date,
      this.id,
      this.userid,
      this.v,
      this.product,
      this.productmodel});

  factory Cartmodel.fromjson(Map m) {
    List<dynamic> productlist=m['products'] ;
    List<Productmodel> product = productlist.map((e) => Productmodel.fromjson(e)).toList();

    return Cartmodel(
        id: m['id'],
        date: m['date'],
        product: m['product'],
        userid: m['userid'],
        v: m['__v'],productmodel: product,);
  }
}

class Productmodel {
  int? productid, quntity;

  Productmodel({this.productid, this.quntity});

  factory Productmodel.fromjson(Map m1) {
    return Productmodel(productid: m1['productId'], quntity: m1['quantity']);
  }
}
