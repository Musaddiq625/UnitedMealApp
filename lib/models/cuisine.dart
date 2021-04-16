class Cuisine {
  int id;
  String cuisineName;
  String imagePath;

  Cuisine({this.id, this.cuisineName, this.imagePath});

  Map toMap() => {'id': id, 'name': cuisineName, 'image': imagePath};
}
