class Productmodel {
  num? id, price;
  String? title, description, category, image;
  Ratingmodel? ratingmodel;

  Productmodel({this.id,
    this.price,
    this.title,
    this.description,
    this.category,
    this.image,
    this.ratingmodel});

  factory Productmodel.fromjson(Map m)
  {
    return Productmodel(
        id: m['id'], title:m['title'], image:m['image'], price:m['price'], category:m['category'], description:m['description'],
        ratingmodel: Ratingmodel.fromjson(m['rating']));
  }
}

class Ratingmodel {
  num? rate, count;

  Ratingmodel({this.rate, this.count});

  factory Ratingmodel.fromjson(Map m1)
  {
    return Ratingmodel(count: m1['count'], rate: m1['rate']);
  }
}