import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_db/components/custom_drawer.dart';
import 'package:project_db/repos/product_repo.dart';

import '../components/custom_carousel.dart';
import '../components/custom_sliver_grid_view.dart';
import '../components/footer.dart';
import '../components/search_appbar.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();
    final TextEditingController searchController = TextEditingController();

    int crossAxisCount = 2;

    if (MediaQuery.of(context).size.width > 600) {
      crossAxisCount = 3;
    }
    if (MediaQuery.of(context).size.width > 900) {
      crossAxisCount = 4;
    }

    SliverGridDelegate gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      childAspectRatio: 1,
    );
    final products = ref.watch(productListProvider);

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: SearchAppbar(
          context: context,
          searchController: searchController,
          checkoutController: controller),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: CarouselWithIndicatorDemo(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                margin: const EdgeInsets.only(left: 8, right: 8),
                height: 130,
                //Height of your promo-banner
                width: MediaQuery.of(context).size.width - 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.brown,
                      Color.fromARGB(255, 245, 215, 204),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    stops: [0.3, 0.9],
                    tileMode: TileMode.repeated,
                  ),
                ),
                child: ClipRect(
                  child: Banner(
                    message: "New Launch",
                    //promotion message
                    location: BannerLocation.topStart,
                    //location of message on container
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Drools Tuna Kitten",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            const Text(
                              "Enriched with Calcium, Iron, and Zinc",
                              style: TextStyle(fontSize: 15),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8, top: 2, bottom: 2),
                                  child: Text(
                                    "Buy Now ",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ),
          products.when(
              data: (data) => CustomSliverGridView(
                    gridDelegate: gridDelegate,
                    products: data,
                  ),
              loading: () => const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              error: (error, stack) => SliverToBoxAdapter(
                    child: Center(
                      child: Text(error.toString()),
                    ),
                  )),
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}
