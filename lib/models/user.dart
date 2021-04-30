class User {
  String id;
  String name;
  String email;
  String password;
  bool isGuest;
  String phoneNo;
  String address;
  double latitude;
  double longitude;

  User({
    this.id,
    this.name,
    this.email,
    this.password = '',
    this.isGuest = false,
    this.phoneNo,
    this.address,
    this.latitude,
    this.longitude
  });

  toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'isGuest': isGuest,
        'phoneNo': phoneNo,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
      };
}
