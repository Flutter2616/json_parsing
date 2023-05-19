class Usermodel {
  String? username, email, name, phone, website;
  int? id;
  Addressmodel? addressmodel;
  Companymodel? companymodel;

  Usermodel(
      {this.username,
      this.email,
      this.name,
      this.phone,
      this.website,
      this.id,
      this.addressmodel,
      this.companymodel});

  factory Usermodel.fromjson(Map m1) {
    return Usermodel(
        name: m1['name'],
        email: m1['email'],
        id: m1['id'],
        phone: m1['phone'],
        username: m1['username'],
        website: m1['website'],
        addressmodel: Addressmodel.fromjson(m1['address']),
        companymodel: Companymodel.fromjson(m1['company']));
  }
}

class Geomodel {
  String? lat, lng;

  Geomodel({this.lat, this.lng});

  factory Geomodel.fromjson(Map m1) {
    return Geomodel(lat: m1['lat'], lng: m1['lng']);
  }
}

class Companymodel {
  String? name, catchPhrase, bs;

  Companymodel({this.name, this.catchPhrase, this.bs});

  factory Companymodel.fromjson(Map m1) {
    return Companymodel(
        name: m1['name'], bs: m1['bs'], catchPhrase: m1['catchPharse']);
  }
}

class Addressmodel {
  String? street, suite, city, zipcode;
  Geomodel? geomodel;

  Addressmodel(
      {this.street, this.suite, this.city, this.zipcode, this.geomodel});

  factory Addressmodel.fromjson(Map m1) {
    return Addressmodel(
        city: m1['city'],
        street: m1['street'],
        suite: m1['suite'],
        zipcode: m1['zipcode'],
        geomodel: Geomodel.fromjson(m1['geo']));
  }
}
