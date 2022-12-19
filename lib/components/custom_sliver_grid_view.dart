import 'package:flutter/material.dart';
import 'package:project_db/services/router_service.dart';

class CustomSliverGridView extends StatelessWidget {
  const CustomSliverGridView({
    Key? key,
    required this.gridDelegate,
  }) : super(key: key);

  final SliverGridDelegate gridDelegate;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Text('Product Name'),
                  const Text('Price'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite),
                        onPressed: () {},
                      ),
                      IconButton(
                          icon: const Icon(Icons.arrow_forward_outlined),
                          onPressed: () {
                            RouterService.pushNamed(context, '/product');
                          })
                    ],
                  )
                ],
              ),
            ),
          );
        },
        childCount: 10,
      ),
      gridDelegate: gridDelegate,
    );
  }
}