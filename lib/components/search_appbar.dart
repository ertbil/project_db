import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_db/components/profile_pop_up_menu.dart';
import 'package:project_db/models/product.dart';
import 'package:project_db/repos/authenticated_user_repo.dart';
import 'package:project_db/services/router_service.dart';

import '../repos/product_repo.dart';
import 'check_out_pop_up_menu.dart';

class SearchAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const SearchAppbar(
      {Key? key,
      required this.context,
      required this.checkoutController,
      required this.searchController})
      : super(key: key);
  final BuildContext context;
  final TextEditingController searchController;
  final TextEditingController checkoutController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productListProvider);
    return AppBar(
      title: const Text("FriendYol"),
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

              ),
              
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Autocomplete<String>(

                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return products.when(
                        data: (data) {
                          return data
                              .map((e) => e.name)
                              .where((element) => element
                                  .toLowerCase()
                                  .contains(textEditingValue.text.toLowerCase()))
                              .toList();
                        },
                        loading: () => const [],
                        error: (e, s) => const []);
                  },
                  onSelected: (selection) {
                    searchController.text = selection;

                    products.whenData((value) => Navigator.pushNamed(
                        context, '/product',
                        arguments: value
                            .firstWhere(
                                (element) => element.name == selection)
                            .id));
                  },
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CheckoutPopUpMenu(controller: checkoutController),
        ),
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: AuthenticatedUserRepo.user != null ? const ProfilePopUpMenu(): ElevatedButton(onPressed: () {
            RouterService.pushNamed(context, '/login');

            }, child: const Text("Giriş Yap")),
        ),
      ],
    );
  }

  static final _appBar = AppBar();

  @override
  Size get preferredSize => _appBar.preferredSize;
}
