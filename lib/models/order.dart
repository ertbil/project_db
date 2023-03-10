class Order {
  final int customerId;
  final int productId;
  final int adressId;
  final String date;

  Order({
    required this.customerId,
    required this.productId,
    required this.adressId,
    required this.date,
  });


  Order.fromJson(Map<String, dynamic> json)
      : customerId = json['CustomerID'],
        productId = json['ProductID'],
        adressId = json['AdressID'],
        date = json['Date'];


  toMap() {
    return {
      'customerId': customerId,
      'productId': productId,
      'adressId': adressId,
      'date': date,
    };
  }
}
