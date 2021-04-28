//
//
// import 'package:getx_app/models/restaurant.dart';
//
// import 'food.dart';
//
// class Order {
//   String id;
//   String orderDate;
//   double deliveryFee;
//   double feeAndTaxes;
//   double subtotal;
//   double total;
//   String userId;
//   String userName;
//   String restaurantId;
//   String restaurantName;
//   Restaurant restaurant;
//   int totalFoodItems;
//   List<Food> foodList;
//
//   Order(
//       this.orderDate,
//       this.deliveryFee,
//       this.feeAndTaxes,
//       this.subtotal,
//       this.total,
//       this.userId,
//       this.userName,
//       this.restaurantId,
//       this.restaurantName,
//       this.restaurant,
//       this.totalFoodItems,
//       this.foodList,
//       {this.id = ''});
//
//   Map<String, dynamic> toMap()=>{
//     'id':id,
//     'date':orderDate,
//     'deliveryFee':deliveryFee,
//     'feeAndTaxes' :feeAndTaxes,
//     'sub_total': subtotal,
//     'total':total,
//     'user_id':userId,
//     'user_name':userName,
//     'restaurant_id':restaurantId,
//     'restaurant_name':restaurantName,
//     'total_food_items':totalFoodItems,
//
//   };
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:getx_app/models/restaurant.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Order {
  String id;
  Timestamp orderDate;
  double deliveryFee;
  double feeAndTaxes;
  double subtotal;
  double total;
  String userId;
  String userName;
  String restaurantId;
  String restaurantName;

  Order(
      {this.id,
      this.deliveryFee,
      this.feeAndTaxes,
      this.subtotal,
      this.total,
      this.userId,
      this.userName,
      this.restaurantId,
      this.restaurantName,
      this.orderDate});

  //need to add food ids and name
  Map<String, dynamic> toMap() => {
        'order_date': DateTime.now(),
        'fee_n_taxes': feeAndTaxes,
        'subtotal': subtotal,
        'total': total,
        'user_id': userId,
        'user_name': userName,
        'restaurant_id': restaurantId,
        'restaurant_name': restaurantName,
      };

  static Order toJson(Map<String, dynamic> orderMap) => Order(
      id: orderMap['id'] ?? '',
      deliveryFee: 0,
      feeAndTaxes: orderMap['fee_n_taxes'] ?? '',
      subtotal: orderMap['subtotal'] ?? 0.0,
      total: orderMap['total'] ?? 0.0,
      restaurantName: orderMap['restaurant_name'] == null ? orderMap['resturant_name'] : '',
      restaurantId: orderMap['restaurant_id'] ?? '',
      userId: orderMap['user_id'] ?? '',
      userName: orderMap['user_name'] ?? '',
      orderDate: orderMap['order_date'] );

  static String timeStampToTime(Timestamp timestamp) => DateFormat('HH:mm a')
      .format(DateTime.fromMillisecondsSinceEpoch((timestamp).millisecondsSinceEpoch));

  static String timeStampToDate(Timestamp timestamp) =>
      DateFormat('dd-MM-yyyy').format(timestamp.toDate());
}
