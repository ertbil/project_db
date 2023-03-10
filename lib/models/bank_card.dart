class BankCard {
  final String ownerName;
  final String cardNumber;
  final String month;
  final String year;
  final String cvc;

  BankCard({
    required this.ownerName,
    required this.cardNumber,
    required this.month,
    required this.year,
    required this.cvc,
  });

  BankCard.fromJson(Map<String, dynamic> json)
      : ownerName = json['ownerName'],
        cardNumber = json['cardNumber'],
        month = json['month'],
        year = json['year'],
        cvc = json['cvc'];

  toMap() {
    return {
      'ownerName': ownerName,
      'cardNumber': cardNumber,
      'month': month,
      'year': year,
      'cvc': cvc,
    };
  }



}