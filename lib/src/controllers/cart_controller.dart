import 'package:get/get.dart';
import 'package:getx_app/database/shared_pref.dart';
import 'package:getx_app/models/cart.dart';
import 'package:getx_app/models/food.dart';
import 'package:getx_app/models/restaurant.dart';
import 'package:getx_app/src/pages/cart.dart';
import 'package:getx_app/src/utils/utilities.dart';

class CartController extends GetxController {
  // RxList<Map<String,dynamic>> items =[{
  //   'quantity':0,
  //   'food':<Food>[].obs
  // }].obs;
  // List<String> comments;
  RxList<Cart> cartItems = <Cart>[].obs;
  double tempTax = 3.70, tempDeliveryFee = 0.00;

  addToCart(
      // String id,
      List<Cart> totalCartItems,
      Food food,
      String comment,
      String restaurantId,
      String restaurantName,
      Restaurant restaurant,
      {int quantity = 1}) {
    int tempInt = 0;
    if (totalCartItems.length > 0) {
      // if(totalCartItems[0].food.restaurantName.toString() == food.restaurantName.toString())
      if(totalCartItems[0].food.restaurantName.toString() != food.restaurantName.toString())
        // Utilities().mySnackBar('Error', 'You can\'t add food from same Restaurant');
        // else
          {
        for (int i = 0; i < totalCartItems.length; i++) {
          if (totalCartItems[i].food.toMap().toString() == food.toMap().toString()) {
            cartItems[i].quantity = cartItems[i].quantity + quantity;
          } else
            tempInt++;
        }
        if (tempInt == totalCartItems.length)
          cartItems.add(Cart(food: food, quantity: quantity, comment: comment,restaurantId: restaurantId, restaurantName: restaurantName,));

      }

    } else {
      cartItems.add(Cart(food: food, quantity: quantity, comment: comment,restaurantId: restaurantId,restaurantName: restaurantName));
    }
    MySharedPref().updateCartItems(cartItems);
    Get.to(()=>CartPage(food.restaurantName));
  }

  removeFromCart(
      // Food food
      int index
      //
      ) {
    // if(cartItems[index].quantity>0)
    // cartItems[index].quantity-=1;
    cartItems.removeAt(index);
    // items.remove(food);
  }

  get getTotalPriceOfCartItems {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++)
      totalPrice += cartItems[i].food.price * cartItems[i].quantity;
    return totalPrice;
  }

  get getTotalPriceOfCartItemsWithAllCharges {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++)
      totalPrice += cartItems[i].food.price * cartItems[i].quantity;
    return totalPrice == 0 ? totalPrice : totalPrice + tempTax + tempDeliveryFee;
  }

  get getIsCartEmpty => cartItems.length == 0;
}
