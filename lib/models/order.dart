

import 'package:getx_app/models/restaurant.dart';

import 'food.dart';

class Order {
  String id;
  String orderDate;
  double deliveryFee;
  double feeAndTaxes;
  double subtotal;
  double total;
  String userId;
  String userName;
  String restaurantId;
  String restaurantName;
  Restaurant restaurant;
  int totalFoodItems;
  List<Food> foodList;

  Order(
      this.orderDate,
      this.deliveryFee,
      this.feeAndTaxes,
      this.subtotal,
      this.total,
      this.userId,
      this.userName,
      this.restaurantId,
      this.restaurantName,
      this.restaurant,
      this.totalFoodItems,
      this.foodList,
      {this.id = ''});

  Map<String, dynamic> toMap()=>{
    'id':id,
    'date':orderDate,
    'deliveryFee':deliveryFee,
    'feeAndTaxes' :feeAndTaxes,
    'sub_total': subtotal,
    'total':total,
    'user_id':userId,
    'user_name':userName,
    'restaurant_id':restaurantId,
    'restaurant_name':restaurantName,
    'total_food_items':totalFoodItems,

  };
}
