import 'package:flutter/material.dart';

import '../services/router_service.dart';

class ProfilePopUpMenu extends StatelessWidget {
  const ProfilePopUpMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
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
        ));
  }
}