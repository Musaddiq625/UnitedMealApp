import 'package:getx_app/models/food.dart';

class Cart{
  int id;
  Food food;
  int quantity;
  String comment;

  Cart({this.id, this.food, this.quantity=0, this.comment=''});
  Map toMap()=>
      {
        'id':id,
        'food':food.toMap(),
        'quantity':quantity,
        'comment':comment

      };
}