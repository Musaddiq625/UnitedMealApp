

class User {
  // final RxString name = ''.obs;
  // final RxString email = ''.obs;
  // final RxInt age = 0.obs;
  // final RxString phoneNo = ''.obs;
  // final RxInt count =0.obs;
  int id;
  String name;
  String email;
  bool isGuest;
  String phoneNo;

  User({this.id, this.name, this.email, this.isGuest=false, this.phoneNo});
  }
