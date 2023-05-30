class Cartmodel {
  String? date;
  int? id, userid, v;
  List<dynamic>? product;
  List<Productmodel1>? productmodel;



  Cartmodel(
      {this.date,
      this.id,
      this.userid,
      this.v,
      this.product,
      this.productmodel});

  factory Cartmodel.fromjson(Map m) {
    List<dynamic> productlist=m['products'] ;
    List<Productmodel1> product = productlist.map((e) => Productmodel1.fromjson(e)).toList();

    return Cartmodel(
        id: m['id'],
        date: m['date'],
        product: m['product'],
        userid: m['userid'],
        v: m['__v'],productmodel: product,);
  }
}

class Productmodel1 {
  int? productid, quntity;

  Productmodel1({this.productid, this.quntity});

  factory Productmodel1.fromjson(Map m1) {
    return Productmodel1(productid: m1['productId'], quntity: m1['quantity']);
  }
}
