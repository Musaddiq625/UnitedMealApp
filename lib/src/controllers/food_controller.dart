import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:getx_app/database/get_firebase_data.dart';
import 'package:getx_app/models/cuisine.dart';
import 'package:getx_app/models/food.dart';

class FoodController extends GetxController {
  FirebaseFunctions firebaseFunctions = FirebaseFunctions();
  RxList<Food> _foodsList = <Food>[].obs;
  RxList<Cuisine> _cuisineList = <Cuisine>[].obs;

  FoodController() {
    _getAllFoodData();
  }

  get getFoodList => _foodsList;

  get getCuisineList => _cuisineList;

  _getAllCuisine()async{

  }
  _getAllFoodData() async {
    // firebaseFunctions.getAllFoods().then((snapshot) {
    //   print('Got Food Data from Firebase');
    //
    //   for (int i = 0; i < snapshot.docs.length; i++) {
    //
    //     _foodsList.add(Food(
    //         id: i,
    //         name: snapshot.docs[i].data()['name'],
    //         imagePath: snapshot.docs[i].data()['image'],
    //         price: double.parse(snapshot.docs[i].data()['price'].toString()),
    //         restaurantName: snapshot.docs[i].data()['restaurant'],
    //         cuisine: snapshot.docs[i].data()['cuisine'],
    //         availableQuantity: int.parse(snapshot.docs[i].data()['available_quantity'].toString()??'0'),
    //         totalRatings: int.parse(snapshot.docs[i].data()['total_ratings'] ?? '0'),
    //         deliveryType: snapshot.docs[i].data()['delivery_type'],
    //         deliveryTimeInMin: int.parse(snapshot.docs[i].data()['delivery_time_in_min'] ?? '0')));
    //   }
    // });

    // children: snapshot.data.docs.map<Widget>((data) {
    //   // print( 'data.data() ${data.data()}');
    //   return GestureDetector(
    //       onTap: () {
    //         Food food = Food(
    //           name: data.data()['name'],
    //           imagePath: data.data()['image'],
    //           availableQuantity: data.data()['available_quantity'],
    //           price: double.parse(data.data()['price'].toString()),
    //         );
    //
    //         return Get.to(() => FoodItemAddToOrder(food));
    //       },
    //       child: item(data.data()['image'], data.data()['name']));
    // }).toList());
  }
}
