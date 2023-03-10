class Comment {
  final String comment;
  final String score;
  final String CustomerID;
  final String ProductID;
  final String ImgUrl;

  Comment({
    required this.comment,
    required this.score,
    required this.CustomerID,
    required this.ProductID,
    required this.ImgUrl,
  });

  Comment.fromJson(Map<String, dynamic> json)
      : comment = json['comment'],
        score = json['score'],
        CustomerID = json['CustomerID'],
        ProductID = json['ProductID'],
        ImgUrl = json['ImgUrl'];


  toMap() {
    return {
      'comment': comment,
      'score': score,
      'CustomerID': CustomerID,
      'ProductID': ProductID,
      'ImgUrl': ImgUrl,
    };
  }

}