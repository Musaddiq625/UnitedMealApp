import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFunctions {
  List formDataList = [];
  CollectionReference _firebaseFireStoreInstanceCuisines =
      FirebaseFirestore.instance.collection('cuisines');
  CollectionReference _firebaseFireStoreInstanceFoods =
      FirebaseFirestore.instance.collection('foods');

  Stream<QuerySnapshot> getAllCuisines() {
    return _firebaseFireStoreInstanceCuisines.snapshots();
  }

  Stream<QuerySnapshot> getAllFoods() {
    return _firebaseFireStoreInstanceFoods.snapshots();
  }

  Stream<QuerySnapshot> getFormData() {
    print('getting form data');
    // formDataList = firebaseFireStoreInstanceForm2.orderBy('date_time',descending: true) .snapshots().toList() as List;
    return _firebaseFireStoreInstanceFoods.orderBy('date_time', descending: true).snapshots();
  }

  uploadFormData(Map<String, dynamic> formModel) {
    _firebaseFireStoreInstanceFoods.add(formModel);
    // .then((value) => myPopUps.mySnackBar('Uploaded', 'Data Uploaded to database'));
  }
}
