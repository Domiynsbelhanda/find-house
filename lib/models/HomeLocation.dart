class HomeLocation {
  int id;
  int user_id;
  int prices;
  int warranty_price;
  String commune;
  String town;
  String district;
  String address;
  String? phone_number;
  String email;
  String latitude;
  String longitude;
  String images;
  int status;
  String reference;
  int type_id;
  // TypeLocation type;
  // DetailLocation detail;
  // List<CategorieDetail> categories;

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
      // this.type,
      // this.detail,
      // this.categories
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
        type_id = json['type_id'];
        // type = json['type'];
        // detail = json['detail'],
        // categories = json['categories'];
}

// class TypeLocation {
//   int id;
//   String name;
//
//   TypeLocation(this.id, this.name);
//   TypeLocation.fromJson(Map<String, dynamic> json)
//     : id = json['id'],
//       name = json['name'];
// }
//
// class DetailLocation {
//   int id;
//   int house_id;
//   int number_rooms;
//   int number_pieces;
//   String toilet;
//   bool electricity;
//   String description;
//
//   DetailLocation(
//       this.id,
//       this.house_id,
//       this.number_rooms,
//       this.number_pieces,
//       this.toilet,
//       this.electricity,
//       this.description
//       );
//   DetailLocation.fromJson(Map<String, dynamic> json)
//   : id = json['id'],
//     house_id = json['house_id'],
//     number_rooms = json['number_rooms'],
//     number_pieces = json['number_pieces'],
//     toilet = json['toilet'],
//     electricity = json['electricity'],
//     description = json['description'];
// }
//
// class CategorieDetail {
//   String name;
//   Pivot pivot;
//
//   CategorieDetail(this.name, this.pivot);
//
//   CategorieDetail.fromJson(Map<String, dynamic> json):
//       name = json['name'],
//       pivot = json['pivot'];
// }

// class Pivot {
//   int house_id;
//   int category_id;
//
//   Pivot(this.house_id, this.category_id);
//
//   Pivot.fromJson(Map<String, dynamic> json)
//     : house_id = json['house_id'],
//       category_id = json['category_id'];
// }