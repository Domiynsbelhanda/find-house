class Slider{
  int id;
  String title;
  String images;
  String description;

  Slider(
      this.id,
      this.title,
      this.images,
      this.description);

  Slider.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        images = json['images'],
        id = json['id'],
        description = json['description'];
}