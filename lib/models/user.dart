class User{
  int id;
  String name;
  String? last_name;
  String? phone_number;
  String email;
  String? images;
  int role_id;

  User(
      this.id,
      this.name,
      this.last_name,
      this.phone_number,
      this.email,
      this.images,
      this.role_id);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        id = json['id'],
        last_name = json['last_name'],
        phone_number = json['phone_number'],
        role_id = json['role_id'],
        images = json['images'];
}