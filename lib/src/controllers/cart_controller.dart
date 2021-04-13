import 'package:get/get.dart';
import 'package:getx_app/models/cart.dart';
import 'package:getx_app/models/food.dart';

class CartController extends GetxController {
  // RxList<Map<String,dynamic>> items =[{
  //   'quantity':0,
  //   'food':<Food>[].obs
  // }].obs;
  // List<String> comments;
  RxList<Cart> cartItems = <Cart>[].obs;

  addToCart(
      // String id,
      Food food,
      String comment,
      {int quantity = 1}) {
    // items.add(food);
    bool exist = false;
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].food == food) {
        exist = true;
        break;
      }
      if(exist)
        cartItems[i].quantity = quantity;
    }
    if(!exist)
    cartItems.add(Cart(food: food,quantity: quantity,comment: comment));
  }

  removeFromCart(
      // Food food
      int index) {
    cartItems.removeAt(index);
    // items.remove(food);
  }
}
