class Rental{
  late int id;
  late int userId;
  late int bikeId;
  late DateTime start;
  late DateTime end;
  late double price;
  late String status;
  late String code;
  Rental({
    required id,
    required userId,
    required bikeId,
    required start,
    required end,
    required price,
    required status
});
}