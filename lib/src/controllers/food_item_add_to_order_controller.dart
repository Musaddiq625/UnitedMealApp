import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/models/restaurant.dart';

class FoodItemAddToOrderController extends GetxController {
  RxInt currentCount = 1.obs;
  int maxCount = 0;
  final FirebaseFunctions firebaseFunctions = FirebaseFunctions();
  Rx<Restaurant> restaurant = Restaurant().obs ;
  FoodItemAddToOrderController(Food foodModel) {
    maxCount = foodModel.availableQuantity ?? 0;
    getRestaurantData(foodModel.restaurantId);
  }

  void incrementCount() {
    if(currentCount.value < maxCount)
    currentCount.value = currentCount.value + 1;
  }

  void decrementCount() {
    if (currentCount.value > 1) currentCount.value = currentCount.value - 1;
  }
  getRestaurantData(String restaurantId)async{
    await firebaseFunctions
        .getFoodWithRestaurantId(restaurantId)
        .then((value) {
       restaurant.value = Restaurant(
        imagePath: value['image'],
        name: value['name'],
        latitude: value['geopoint'].latitude,
        longitude: value['geopoint'].longitude,
        ratings: value['ratings'],
      );});
  }
}
