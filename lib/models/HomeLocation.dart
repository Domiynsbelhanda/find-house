import 'dart:convert';

class HomeLocation {
  dynamic id;
  dynamic user_id;
  dynamic prices;
  dynamic warranty_price;
  dynamic commune;
  dynamic town;
  dynamic district;
  dynamic address;
  dynamic phone_number;
  dynamic email;
  dynamic latitude;
  dynamic longitude;
  dynamic images;
  dynamic status;
  String reference;
  dynamic type_id;
  TypeLocation type;
  DetailLocation detail;
  List<CategorieDetail> categories;

  HomeLocation(
    this.id,
      this.user_id,
      this.prices,
      this.warranty_price,
      this.commune,
      this.town,
      this.district,
      this.address,
      this.phone_number,
      this.email,
      this.latitude,
      this.longitude,
      this.images,
      this.status,
      this.reference,
      this.type_id,
      this.type,
      this.detail,
      this.categories
  );

  HomeLocation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        user_id = json['user_id'],
        prices = json['prices'],
        warranty_price = json['warranty_price'],
        commune = json['commune'],
        town = json['town'],
        district = json['district'],
        address = json['address'],
        phone_number = json['phone_number'],
        email = json['email'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        images = json['images'],
        status = json['status'],
        reference = json['reference'],
        type_id = json['type_id'],
        type = TypeLocation.fromJson(jsonDecode(jsonEncode(json['type']))),
        detail = DetailLocation.fromJson(jsonDecode(jsonEncode(json['detail']))),
        categories = List<CategorieDetail>.from(jsonDecode(jsonEncode(json['categories'])).map((model)=>CategorieDetail.fromJson(model)));
}

class TypeLocation {
  dynamic id;
  dynamic name;

  TypeLocation(this.id, this.name);
  TypeLocation.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'];
}

class DetailLocation {
  dynamic id;
  dynamic house_id;
  dynamic number_rooms;
  dynamic number_pieces;
  dynamic toilet;
  dynamic electricity;
  dynamic description;

  DetailLocation(
      this.id,
      this.house_id,
      this.number_rooms,
      this.number_pieces,
      this.toilet,
      this.electricity,
      this.description
      );
  DetailLocation.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    house_id = json['house_id'],
    number_rooms = json['number_rooms'],
    number_pieces = json['number_pieces'],
    toilet = json['toilet'],
    electricity = json['electricity'],
    description = json['description'];
}

class CategorieDetail {
  dynamic name;

  CategorieDetail(this.name);

  CategorieDetail.fromJson(Map<String, dynamic> json):
      name = json['name'];
}

class Pivot {
  dynamic house_id;
  dynamic category_id;

  Pivot(this.house_id, this.category_id);

  Pivot.fromJson(Map<String, dynamic> json)
    : house_id = json['house_id'],
      category_id = json['category_id'];
}