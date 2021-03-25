import 'package:getx_app/models/food.dart';

class Restaurant {
  int id;
  String name;
  List<String> cuisines;
  String imagePath;
  String address;
  double latitude;
  double longitude;
  List<Food> restaurantFoods;
  double ratings;
  Restaurant({
    this.id,
    this.name,
    this.cuisines,
    this.imagePath,
    this.address,
    this.latitude,
    this.longitude,
    this.restaurantFoods,
    this.ratings,
  });

  toMap() =>
      {
        'id': id,
        'name': name,
        'cuisines': cuisines,
        'imagePath': imagePath,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'restaurantFoods': restaurantFoods,
        'ratings':ratings,
      };

  String getCuisines() =>
      cuisines.toString().substring(1, cuisines
          .toString()
          .length - 1);
}
