import 'package:getx_app/models/food.dart';
import 'package:getx_app/models/restaurant.dart';

class Cart{
  int id;
  Restaurant restaurant;
  Food food;

  int quantity;
  String comment;
  String restaurantId;
  String restaurantName;

  Cart({this.id, this.restaurant,this.food, this.quantity=0, this.comment='',this.restaurantId, this.restaurantName});
  Map<String, dynamic> toMap()=>
      {
        'id':id,
        'restaurant':restaurant.toMap(),
        'food':food.toMap(),
        'quantity':quantity,
        'comment':comment,
        'restaurant_id':restaurantId,
        'restaurant_name':restaurantName

      };
}