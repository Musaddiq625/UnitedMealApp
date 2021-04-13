import 'package:get/get.dart';
import 'package:getx_app/database/shared_pref.dart';
import 'package:getx_app/models/cart.dart';
import 'package:getx_app/models/food.dart';

class CartController extends GetxController {
  // RxList<Map<String,dynamic>> items =[{
  //   'quantity':0,
  //   'food':<Food>[].obs
  // }].obs;
  // List<String> comments;
  RxList<Cart> cartItems = <Cart>[].obs;
  double tempTax = 3.70, tempDeliveryFee = 0.52;

  addToCart(
      // String id,
      List<Cart> totalCartItems,
      Food food,
      String comment,
      {int quantity = 1}) {
    int tempInt = 0;
    // print('quantity: $quantity');
    // items.add(food);
    // print('totalCartItems: $totalCartItems');
    if (totalCartItems.length > 0) {
      // print('in if');
      for (int i = 0; i < totalCartItems.length; i++) {
        // print('found');
        // print(totalCartItems[i].food.toMap().toString());
        // print(food.toMap().toString());
        // print('^^^^^^');
        if (totalCartItems[i].food.toMap().toString() == food.toMap().toString()) {
          // print('HEREE');
          cartItems[i].quantity = cartItems[i].quantity + quantity;
        } else
          tempInt++;
      }
      if (tempInt == totalCartItems.length)
        cartItems.add(Cart(food: food, quantity: quantity, comment: comment));
    } else {
      // print('in else');
      cartItems.add(Cart(food: food, quantity: quantity, comment: comment));
    }
MySharedPref().updateCartItems(cartItems);

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
