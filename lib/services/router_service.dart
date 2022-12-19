import 'package:flutter/material.dart';

class RouterService {
  static void pushReplacementRoute(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));
  }

  static void pushRoute(BuildContext context, Widget widget) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => widget));
  }

  static void pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName)
  }
}