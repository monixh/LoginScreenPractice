/* {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }*/

class User {
  final int id;
  final String name, username, email, website, phone;
  Address address;

  User(
      {required this.id,
      required this.phone,
      required this.name,
      required this.username,
      required this.email,
      required this.website,
      required this.address});

  static User convert(Map json) {
    return User(
        id: json['id'],
        phone: json['phone'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        website: json['website'],
        address: Address.convertJsonToAddress(json['address']));
  }
}

/*"address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",*/

class Address {
  final String street, suite, city, zipcode;
  Geo geo;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});

  static Address convertJsonToAddress(Map json) {
    return Address(
        street: json['street'],
        suite: json['suite'],
        city: json['city'],
        zipcode: json['zipcode'],
        geo: Geo.convertToGeo(json['geo']));
  }
}

/*"geo": {
        "lat": "-37.3159",
        "lng": "81.1496"*/

class Geo {
  final String lat, lang;

  Geo({required this.lat, required this.lang});

  static Geo convertToGeo(Map json) {
    return Geo(lat: json['lat'], lang: json['lng']);
  }
}
