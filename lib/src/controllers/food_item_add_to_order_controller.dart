import 'package:get/get.dart';
import 'package:getx_app/models/food.dart';

class FoodItemAddToOrderController extends GetxController {
  RxInt currentCount = 1.obs;
  int maxCount = 0;

  FoodItemAddToOrderController(Food foodModel) {
    maxCount = foodModel.availableQuantity ?? 0;
  }

  void incrementCount() {
    if(currentCount.value < maxCount)
    currentCount.value = currentCount.value + 1;
  }

  void decrementCount() {
    if (currentCount.value > 1) currentCount.value = currentCount.value - 1;
  }
}
