class Bike{
  late int id;
  late String name;
  late String description;
  late String owner;
  late int price;
  late String address;
  late String phone;
  Bike({
    required this.id,
    required this.name,
    required this.description,
    required this.owner,
    required this.price,
    required this.address,
    required this.phone
});
  factory Bike.fromJson(Map<String, dynamic> json) {
    return Bike(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      owner: json['owner'],
      price: json['price'].toInt(),
      address: json['location'],
      phone: json['phone'],
    );
  }
}

class Results{

}