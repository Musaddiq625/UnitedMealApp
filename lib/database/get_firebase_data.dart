import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_app/models/user.dart';

class FirebaseFunctions {
  List formDataList = [];
  CollectionReference _firebaseFireStoreInstanceCuisines =
      FirebaseFirestore.instance.collection('cuisines');
  CollectionReference _firebaseFireStoreInstanceUsers =
  FirebaseFirestore.instance.collection('users');
  CollectionReference _firebaseFireStoreInstanceFoods =
      FirebaseFirestore.instance.collection('foods');
  CollectionReference _firebaseFireStoreInstanceRestaurantsWithFoods =
      FirebaseFirestore.instance.collection('restaurants');

  Stream<QuerySnapshot> getAllCuisines() {
    return _firebaseFireStoreInstanceCuisines.snapshots();
  }
 //
 // Future getAllFoodsFuture() {
 //    return _firebaseFireStoreInstanceFoods.get();
 //  }
 //
 //  Future getAllRestaurantsWithFoodsFuture() {
 //    return _firebaseFireStoreInstanceRestaurantsWithFoods.get();
 //  }
 Stream<QuerySnapshot> getAllFoodsStream() {
    return _firebaseFireStoreInstanceFoods.snapshots();
  }

  Stream<QuerySnapshot> getAllRestaurantsWithFoodsStream() {
    return _firebaseFireStoreInstanceRestaurantsWithFoods.snapshots();
  }

  Future<int> getAllFoodsTotal() {
    return _firebaseFireStoreInstanceFoods.get().then((value) => value.docs.length);
  }

  Future<int> getAllRestaurantsTotal() {
    return _firebaseFireStoreInstanceRestaurantsWithFoods.get().then((value) => value.docs.length);
  }

  // Future getAllFoods() {
  //   return _firebaseFireStoreInstanceFoods.get();
  // }

  Stream<QuerySnapshot> getFormData() {
    print('getting form data');
    // formDataList = firebaseFireStoreInstanceForm2.orderBy('date_time',descending: true) .snapshots().toList() as List;
    return _firebaseFireStoreInstanceFoods.orderBy('date_time', descending: true).snapshots();
  }

  uploadFormData(Map<String, dynamic> formModel) {
    _firebaseFireStoreInstanceFoods.add(formModel);
    // .then((value) => myPopUps.mySnackBar('Uploaded', 'Data Uploaded to database'));
  }

  Future signUp(User user) =>
      _firebaseFireStoreInstanceUsers.add(user.toMap()).then((value) => value?.path != null);

  Future<String> login(String email, String password) async {
    return await _firebaseFireStoreInstanceUsers
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.docs.length < 1
            ? ''
            : value.docs[0].data()['password'] == password
                ? jsonEncode(value.docs[0].data())
                : '')
        .catchError((_) => '');
  }
}
