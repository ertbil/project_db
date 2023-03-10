import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_db/pages/login_page.dart';
import 'package:project_db/pages/main_page.dart';
import 'package:project_db/pages/product_page.dart';
import 'package:project_db/pages/profile_page.dart';
import 'package:project_db/pages/register_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Route? onGenerate(settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/product':
        if(arguments is int) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => ProductDetailPage(id: arguments),

          );
        }

    }
    return null;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      onGenerateRoute: onGenerate,

      routes: {
        '/': (context) => const MainPage(),
        '/profile': (context) => const ProfilePage(),
        '/register': (context) =>  RegisterPage(),
        '/login': (context) => const LoginPage(),








      },


      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
    );
  }



}


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

