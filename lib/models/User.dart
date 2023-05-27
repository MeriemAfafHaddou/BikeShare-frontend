class User{
  late String firstName;
  late String lastName;
  late String phone;
  late String email;
  late String position;
  User({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.position
});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      email: json['email'],
      position: json['position']
    );
  }

}