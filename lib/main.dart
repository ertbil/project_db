import 'package:flutter/material.dart';
import 'package:project_db/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        '/': (context) => const MainPage(),
        // '/profile': (context) => const ProfilePage(),
        //' /settings': (context) => const SettingsPage(),
        // '/login': (context) => const LoginPage(),
        // '/register': (context) => const RegisterPage(),
        // '/men': (context) => MenPage(),
        // '/women' : (context) => WomenPage(),
        // '/kids' : (context) => KidsPage(),
        // '/cart' : (context) => CartPage(),
        // '/checkout' : (context) => CheckoutPage(),
        // '/payment' : (context) => PaymentPage(),
        // '/order' : (context) => OrderPage(),




      },


      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
    );
  }
}

