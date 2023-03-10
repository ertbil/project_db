class PastOrder {
  //Name, ImageUrl,Price
  final String name;
  final String imageUrl;
  final double price;

  PastOrder({
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  PastOrder.fromJson(Map<String, dynamic> json)
      : name = json['Name'],
        imageUrl = json['ImageUrl'],
        price = json['Price'];

  toMap() {
    return {
      'Name': name,
      'ImageUrl': imageUrl,
      'Price': price,
    };
  }
}
