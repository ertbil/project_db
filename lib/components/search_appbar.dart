import 'package:flutter/material.dart';
import 'package:project_db/components/custom_text_form_field.dart';

import '../services/router_service.dart';

AppBar SearchAppbar(BuildContext context, TextEditingController _controller) {
  return AppBar(
    title: const Text("FriendYol"),
    actions: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: CustomTextFormField(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: PopupMenuButton(
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
                              onPressed: () {},
                              icon: const Icon(Icons.minimize)),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: TextField(
                              controller: _controller,
                              onChanged: (value) {
                                _controller.text = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fillColor: Colors.grey,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            icon: const Icon(Icons.shopping_cart)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: PopupMenuButton(
            onSelected: (value) {
              RouterService.pushNamed(context, value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: '/profile',
                  child: Text("My Account"),
                ),
                const PopupMenuItem<String>(
                  value: '/settings',
                  child: Text("Settings"),
                ),
                const PopupMenuItem<String>(
                  value: '/login',
                  child: Text("Logout"),
                ),
              ];
            },
            icon: const CircleAvatar(
              radius: 20,
              child: Icon(
                Icons.person,
                size: 20,
              ),
            )),
      ),
    ],
  );
}
