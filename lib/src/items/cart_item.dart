import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/cart.dart';
import 'package:getx_app/src/controllers/cart_controller.dart';

import '../const.dart';

class CartItem extends StatelessWidget {
  final index;

  CartItem(this.index);

  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          decoration:
              BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(.5)))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text('${cartModel?.quantity} x', textScaleFactor: 1.1),
                Text('${cartController.cartItems[index].quantity} x', textScaleFactor: 1.1),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartController.cartItems[index].food?.name ?? '',
                            textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        // Text(cartController.cartItems[index]?.food?.cuisine ?? '',
                        //     textScaleFactor: .9, style: TextStyle(color: Colors.grey)),
                        Text(cartController.cartItems[index]?.food?.restaurantName??'',
                            textScaleFactor: .9, style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                      '\$' +
                          (cartController.cartItems[index].quantity *
                                      cartController.cartItems[index]?.food?.price ??
                                  0)
                              .toString() ,

                      textScaleFactor: 1.2),
                ),
                GestureDetector(
                  onTap: () {
                    cartController.removeFromCart(index);
                  },
                  child: CircleAvatar(
                      backgroundColor: Constants.GREY_COLOR,
                      child: Icon(Icons.delete_outline, color: Colors.black, size: 20)),
                )
              ],
            ),
          ),
        ));
  }
}
