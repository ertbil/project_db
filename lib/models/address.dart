class Adress {
  final String buildingNumber;
  final String street;
  final String localityArea;
  final String city;
  final String PostCode;

  Adress({
    required this.buildingNumber,
    required this.street,
    required this.localityArea,
    required this.city,
    required this.PostCode,
  });

  Adress.fromJson(Map<String, dynamic> json)
      : buildingNumber = json['buildingNumber'],
        street = json['street'],
        localityArea = json['localityArea'],
        city = json['city'],
        PostCode = json['PostCode'];

  toMap() {
    return {
      'buildingNumber': buildingNumber,
      'street': street,
      'localityArea': localityArea,
      'city': city,
      'PostCode': PostCode,
    };
  }


}