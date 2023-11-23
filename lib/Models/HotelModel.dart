class HotelModel {
  final String name;
  final String location;
  final double pricePerNight;
  final  List<String> facilities;
  final double rating;
  final String description;

  HotelModel({
    required this.name,
    required this.location,
    required this.pricePerNight,
    required this.facilities,
    required this.rating,
    required this.description,
  });
}

class PaymentModel {
  final double pricePerNight;
  final double tax;
  int numberOfPeople;
  double total;
  String paymentMethod;

  final List<String> metodePembayaranList = [
    "Kartu Kredit",
    "PayPal",
    "Transfer Bank",
    "OVO",
  ];

  PaymentModel({
    required this.pricePerNight,
    required this.tax,
    this.numberOfPeople = 1,
    this.total = 0.0,
    this.paymentMethod = "Kartu Kredit",
  });

  double calculateTotal() {
    total = (pricePerNight * numberOfPeople) + tax;
    return total;
  }
}
