class Food {
  int id;
  String name;
  String restaurantName;
  String imagePath;
  double price;
  int deliveryTimeInMin;
  String deliveryType;
  String cuisine;

  int totalRatings;

  Food(
      {this.id,
      this.name,
      this.restaurantName,
      this.imagePath,
      this.price,
      this.deliveryTimeInMin,
      this.deliveryType,
      this.cuisine,
      this.totalRatings});

  toMap() => {
        'id': id,
        'name': name,
        'restaurantName': restaurantName,
        'imagePath': imagePath,
        'price': price,
        'deliveryTimeInMin': deliveryTimeInMin,
        'deliveryType': deliveryType,
        'cuisine': cuisine,
        'totalRatings': totalRatings,
      };


}
