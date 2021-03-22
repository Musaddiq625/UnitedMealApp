class Food {
  int id;
  String name;
  String restaurantName;
  String imagePath;
  double price;
  int deliveryTimeInMin;
  String deliveryType;
  List<String> cuisines;
  double ratings;
  int totalRatings;

  Food(
      {this.id,
      this.name,
        this.restaurantName,
      this.imagePath,
      this.price,
      this.deliveryTimeInMin,
      this.deliveryType,
      this.cuisines,
      this.ratings,
      this.totalRatings});
  String getCuisines()=>
      cuisines.toString().substring(1,cuisines.toString().length-1);
}