class Endpoints {
  static const String baseUrl = 'http://localhost:5000';
  static const String products = 'products';

  ///User işlemleri
  static const String users = 'users';
  static const String login = 'login';
  static const String register = 'register';
  static const String delete = 'delete'; //'/delete/:customerId'
  static const String updateEmail =
      'update-email'; //'/update-email/:customerId'
  static const String createFirstCard =
      'create-first-card'; //'/create-first-card/:customerId'
  static const String createSecondCard =
      'create-second-card'; //'/create-second-card/:customerId'
  static const String pastOrders = 'pastorders'; //'/past-orders/:customerId'
  static const String updatePassword =
      'update-password'; //'/update-password/:customerId'
  static const String createFirstAddress =
      'create-first-address'; //'/create-address/:customerId'
  static const String createSecondAddress =
      'create-second-address'; //'create-second-address/:customerId'
  static const String updateCustomerScore =
      'update-customer-score'; //'/update-customer-score/:customerId'

  /// Ürün İşlemleri
  static const String mostSoldProducts = 'most-sold-products';

  /// kategoriye göre
  static const String categories = 'categories';
  static const String getAll = 'getall';
  static const String getone = 'getone'; // categories/getone/:category
  static const String customerType =
      'customertype'; // /customertype/:customertype

  ///favori işlemleri
  static const String favoriteProduct =
      'favoriteproduct'; // /favoriteproduct/:productId
  static const String unfavoriteProduct =
      'unfavoriteproduct'; // /unfavoriteproduct/:productId

  ///Sepet işlemleri
  static const String addToBasket = 'addtobasket'; // /addtobasket/:productId
  static const String removeFromBasket =
      'removefrombasket'; // /removefrombasket/:productId

  /// Arama işlemleri
  static const String searchBySize = 'searchbysize'; // /searchbysize/:size
  static const String searchByColor = 'searchbycolor'; // /searchbycolor/:color

  /// yorum işlemleri
  static const String addComment = 'add-comment'; // /addcomment/:productId
  static const String updateComment =
      'update-comment'; // /updatecomment/:productId

  /// Sipariş işlemleri
  static const String createOrder = 'create-order'; // /createorder
  static const String refundOrder = 'return-product'; // /refundorder/:productId
  static const String refundList =
      'get-return-list'; // /refund-list/:customerId

  /// Şirket işlemleri
  static const String companies = 'companies';
  static const String searchBranchByName =
      'searchbranchbyname'; // /searchbranchbyname/:cityame
  static const String searchBranchByPostCode =
      'searchbranchbypostcode'; // /searchbranchbypostcode/:postcode

}
