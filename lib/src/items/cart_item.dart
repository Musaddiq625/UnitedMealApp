import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/cart.dart';
import 'package:getx_app/src/controllers/cart_controller.dart';

import '../const.dart';
class CartItem extends StatelessWidget {
  final int count, index;
  final Cart cartModel;

  CartItem(this.index,this.count,this.cartModel);
  final CartController cartController= Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
      BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(.5)))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${cartModel?.quantity} x', textScaleFactor: 1.1),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartModel?.food?.name??'',
                        textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(cartModel?.food?.cuisine??'', textScaleFactor: .9, style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Text('\$'+(cartModel.quantity * cartModel?.food?.price??0).toString(), textScaleFactor: 1.2)),
            GestureDetector(
              onTap: (){
                cartController.removeFromCart(index);
              },
              child: CircleAvatar(
                  backgroundColor: Constants.GREY_COLOR,

                  child: Icon(Icons.delete_outline, color: Colors.black, size: 20)),
            )
          ],
        ),
      ),
    );
  }
}


