import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/food.dart';

import '../const.dart';
class CartItem extends StatelessWidget {
  final int count;
  final Food foodModel;

  CartItem(this.count,this.foodModel);
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
            Text('$count x', textScaleFactor: 1.1),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(foodModel.name,
                        textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(foodModel.cuisine, textScaleFactor: .9, style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
            Expanded(child: Text('\$${foodModel.price}', textScaleFactor: 1.2)),
            CircleAvatar(
                backgroundColor: Constants.GREY_COLOR,
                child: Icon(Icons.delete_outline, color: Colors.black, size: 20))
          ],
        ),
      ),
    );
  }
}


