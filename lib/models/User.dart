class User{
  late String name;
  late String password;
  late String phone;
  late String email;
  late String address;
  User({
    required this.name,
    required this.password,
    required this.phone,
    required this.email,
    required this.address
});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      password: json['password'],
      phone: json['phone'],
      email: json['email'],
      address: json['address']
    );
  }

}

late final User userInfos;