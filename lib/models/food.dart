class Food {
  int id;
  String name;
  String restaurantName;
  String imagePath;
  double price;
  int deliveryTimeInMin;
  String deliveryType;
  String cuisine;
  int availableQuantity;

  int totalRatings;

  Food(
      {this.id,
      this.name,
      this.restaurantName,
      this.imagePath,
      this.price=0,
      this.deliveryTimeInMin=0,
      this.deliveryType,
      this.cuisine,
      this.availableQuantity = 0  ,
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
        'available_quantity': availableQuantity,
        'totalRatings': totalRatings,
      };


}
