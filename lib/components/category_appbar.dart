import 'package:flutter/material.dart';

import '../consts/categories.dart';

AppBar CategoryAppBar(BuildContext context) {
  return AppBar(
      centerTitle: true,

      title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < Categories.generalCategories.keys.length; i++)
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/category',
                          arguments: Categories.generalCategories.keys.toList()[i]);
                    },
                    child: Text(
                      Categories.generalCategories.keys.toList()[i],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  PopupMenuButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    itemBuilder: (context) {
                      return Categories.generalCategories.values
                          .toList()[i]
                          .map((e) => PopupMenuItem(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/category',
                                        arguments: e);
                                  },
                                  child: Text(e),
                                ),
                              ))
                          .toList();

                  },
                  )
                ],
              )


          ],
        ),
      ));
}