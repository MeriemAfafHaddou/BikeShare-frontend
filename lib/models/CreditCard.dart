class CreditCard{
  late String id;
  late String number;
  late String name;
  late String exp;
  CreditCard({
    required this.id,
    required this.number,
    required this.name,
    required this.exp,
});
  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
      id: json['_id'],
      number: json['number'],
      name:"Afaf haddou",
      exp: json['expiringDate'],
    );
  }

}