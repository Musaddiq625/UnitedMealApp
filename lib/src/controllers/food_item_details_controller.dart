import 'package:get/get.dart';

class FoodItemDetailsController extends GetxController{
  RxInt selectedIndex = 0.obs;
  changeDeliveryType(int updatedIndex)=>selectedIndex.value = updatedIndex;
}