import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_db/models/product.dart';

import '../services/data_service.dart';

final FutureProvider<List<Product>> productListProvider =
FutureProvider((ref) async {
  return ref.read(dataServiceProvider).getProducts();
});