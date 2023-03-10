import 'package:flutter/material.dart';

import '../models/product.dart';

class CustomSliverGridView extends StatelessWidget {
  const CustomSliverGridView({
    Key? key,
    required this.gridDelegate,
    required this.products,
  }) : super(key: key);

  final SliverGridDelegate gridDelegate;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/product',
                  arguments: products[index].id);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        products[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        products[index].name,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${products[index].price} TL",
                            style: TextStyle(fontSize: 20,
                            color: Colors.orange),

                            overflow: TextOverflow.fade,

                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border),
                        ),
                        IconButton(onPressed: () {

                        }, icon: Icon(Icons.shopping_cart_outlined)),


                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: products.length,
      ),
      gridDelegate: gridDelegate,
    );
  }
}
