import 'package:get/get.dart';
import 'package:getx_app/models/food.dart';

class CartController extends GetxController{

  RxList<Food> items = <Food>[

  ].obs;
  List<String> comments;

  addToCart(
      Food food, String comment){
    items.add(food);

  }
  removeFromCart(Food food){
    items.remove(food);
  }

}