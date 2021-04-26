class Food {
  String id;
  String name;
  String restaurantId;
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
      this.price = 0,
      this.deliveryTimeInMin = 0,
      this.deliveryType,
      this.cuisine,
      this.availableQuantity = 0,
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

  Food toModel(Map<String, dynamic> foodModel) => Food(
      id: foodModel['id'] ?? '',
      name: foodModel['name'],
      restaurantName: foodModel['restaurantName'],
      imagePath: foodModel['imagePath'],
      price: foodModel['price'],
      deliveryTimeInMin: foodModel['deliveryTimeInMin'],
      deliveryType: foodModel['deliveryType'],
      availableQuantity: foodModel['available_quantity'],
      totalRatings: foodModel['totalRatings']);
}
