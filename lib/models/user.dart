class User {
  int id;
  String name;
  String email;
  bool isGuest;
  String phoneNo;

  User({
    this.id,
    this.name,
    this.email,
    this.isGuest = false,
    this.phoneNo,
  });

  toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'isGuest': isGuest,
        'phoneNo': phoneNo,
      };
}
