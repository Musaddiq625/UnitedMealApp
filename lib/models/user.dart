class User {
  String id;
  String name;
  String email;
  String password;
  bool isGuest;
  String phoneNo;
  String address;

  User({
    this.id,
    this.name,
    this.email,
    this.password = '',
    this.isGuest = false,
    this.phoneNo,
    this.address,
  });

  toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'isGuest': isGuest,
        'phoneNo': phoneNo,
        'address': address,
      };
}
