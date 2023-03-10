import 'package:flutter/material.dart';

class CheckoutPopUpMenu extends StatelessWidget {
  const CheckoutPopUpMenu({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
              child: SizedBox(
                width: 200,
                height: 80,
                child: ListTile(
                  title: const Text('product'),
                  subtitle: Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.minimize)),
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: TextField(
                          controller: controller,
                          onChanged: (value) {
                            controller.text = value;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.grey,
                          ),
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.delete)),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        icon: const Icon(Icons.shopping_cart));
  }
}