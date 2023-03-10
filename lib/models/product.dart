class Product {
  final int id;
  final String name;
  final String description;
  final String price;
  final String imageUrl;
  final int saleAmount;
  final double score;
  final category;
  final int favAmount;
  final String size;
  final String color;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.saleAmount,
    required this.score,
    required this.category,
    required this.favAmount,
    required this.size,
    required this.color,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['ID'],
        name = json['Name'] ?? "",
        description = json['description'] ?? "Satıcı bilgi vermedi",
        price = json['Price'] ?? 0.0,
        imageUrl = json['ImageUrl'] ??
            "https://i.pinimg.com/originals/7a/0d/7d/7a0d7d8b0f1c1b0f1b0f1b0f1b0f1b0f.jpg",
        saleAmount = json['SaleAmount'] ?? 0,
        score = double.parse(json['Score'].toString()) ?? 0.0,
        category = json['Category'] ?? "Kategori bilgisi verilmedi",
        favAmount = json['FavAmount'] ?? 0,
        size = json['Size'] ?? "Bilgi verilmedi",
        color = json['Color'] ?? "Bilgi verilmedi";

  toMap() {
    return {
      'id': id,
      'title': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'saleAmount': saleAmount,
      'score': score,
      'category': category,
      'favAmount': favAmount,
      'size': size,
      'color': color,

    };
  }
}
