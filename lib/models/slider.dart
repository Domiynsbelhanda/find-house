class Sliders{
  dynamic id;
  dynamic title;
  dynamic images;
  dynamic description;

  Sliders(
      this.id,
      this.title,
      this.images,
      this.description);

  Sliders.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        images = json['images'],
        id = json['id'] as int,
        description = json['description'];
}