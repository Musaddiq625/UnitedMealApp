import 'package:get/get.dart';

class FoodItemAddToOrderController extends GetxController {
  RxInt currentCount = 1.obs;

  void incrementCount() {
    currentCount.value = currentCount.value + 1;
  }

  void decrementCount() {
    if (currentCount.value > 1) currentCount.value = currentCount.value - 1;
  }
}
