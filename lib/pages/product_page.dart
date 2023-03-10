import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_db/components/footer.dart';
import 'package:project_db/components/search_appbar.dart';
import 'package:project_db/models/product.dart';
import 'package:project_db/repos/authenticated_user_repo.dart';

import '../components/chip.dart';
import '../components/custom_carousel.dart';
import '../components/drop_down_button.dart';
import '../consts/strings.dart';
import '../services/data_service.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  ProductDetailPage({Key? key, this.id = -1}) : super(key: key);
  final int id;
  var productColor;
  var chipColor = Colors.grey;
  var productSize;
  bool isLiked = false;

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  late final FutureProvider<Product> productProvider =
      FutureProvider((ref) async {
    return ref.read(dataServiceProvider).getProduct(widget.id);
  });
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AsyncValue<Product> product = ref.watch(productProvider);
    return Scaffold(
      appBar: SearchAppbar(
          context: context,
          checkoutController: _controller,
          searchController: _searchController),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: product.when(
                      data: (data) => Image.network(
                        data.imageUrl,
                        fit: BoxFit.contain,
                        frameBuilder: (BuildContext context, Widget child,
                            int? frame, bool wasSynchronouslyLoaded) {
                          if (wasSynchronouslyLoaded) {
                            return child;
                          }
                          return AnimatedOpacity(
                            child: child,
                            opacity: frame == null ? 0 : 1,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeOut,
                          );
                        },
                      ),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (e, s) => const Center(child: Text("Error")),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: product.when(
                      data: (data) => ListView(
                        children: [
                          Text(
                            data.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            data.description,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Price: ${Strings.TL} ${data.price}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Değerlendirme:",
                            style: TextStyle(fontSize: 16),
                          ),
                          Row(
                            children: [
                              for (int i = 0; i < data.score; i++)
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                              for (int i = 0; i < 5 - data.score; i++)
                                const Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomDropDownButton(
                              items: [
                                DropdownMenuItem(
                                    child: Text(data.color.toString()))
                              ],
                              onChanged: (value) {
                                setState(() {
                                  widget.productColor = value;
                                });
                              },
                              hintText: "Renk Seçiniz"),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (var size in data.size.split(','))
                                CustomChip(
                                  label: size.toString(),
                                  color: widget.chipColor,
                                  onTap: () {
                                    setState(() {
                                      widget.productSize = size;
                                      if (widget.chipColor == Colors.grey) {
                                        widget.chipColor = Colors.blue;
                                      } else {
                                        widget.chipColor = Colors.grey;
                                      }
                                    });
                                  },
                                ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("Add to Cart"),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (AuthenticatedUserRepo.user != null) {
                                      setState(() {
                                        widget.isLiked = !widget.isLiked;
                                      });
                                      final result = ref
                                          .watch(dataServiceProvider)
                                          .favoriteProduct(
                                          AuthenticatedUserRepo.user!.id,

                                              data.id);
                                      result.onError((error, stackTrace) => {
                                            setState(() {
                                              widget.isLiked = !widget.isLiked;
                                            })
                                          });
                                    }
                                    else{
                                      Navigator.pushNamed(context, "/login");
                                    }
                                  },
                                  icon: !widget.isLiked
                                      ? const Icon(Icons.favorite_border)
                                      : const Icon(Icons.favorite,
                                          color: Colors.red)),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.share)),
                            ],
                          ),
                        ],
                      ),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (e, s) => const Center(child: Text("Error")),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Related Products",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: CarouselWithIndicatorDemo(
                  hasAppBar: false,
                )),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Yorumlar",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return const ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text("john Doe"),
                    subtitle: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc vel tincidunt luctus, nunc nunc aliquet nisl, eu aliquet nunc nunc euismod nisl. Sed euismod, nunc vel tincidunt luctus, nunc nunc aliquet nisl, eu aliquet nunc nunc euismod nisl."),
                    trailing: Icon(Icons.star),
                  );
                },
                itemCount: 10,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
