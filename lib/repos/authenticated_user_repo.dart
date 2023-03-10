import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_db/services/data_service.dart';

import '../models/user.dart';

class AuthenticatedUserRepo extends ChangeNotifier {
  static User? user;
  final DataService dataService;

  AuthenticatedUserRepo(this.dataService);

  void setUser(User user) {
    AuthenticatedUserRepo.user = user;
    notifyListeners();
  }
}

final userProvider = ChangeNotifierProvider(
  (ref) {
    return AuthenticatedUserRepo(ref.watch(dataServiceProvider));
  },
);
final FutureProvider<User> userFromDatabase = FutureProvider((ref) async {
  return ref
      .read(dataServiceProvider)
      .getUser(AuthenticatedUserRepo.user!.id);
});
