class Sliders{
  int id;
  String title;
  String images;
  String description;

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