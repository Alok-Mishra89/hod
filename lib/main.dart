import 'package:flutter/material.dart';
import 'package:house_of_dogs/Pages/bottom_nav.dart';
import 'package:house_of_dogs/splash_screen.dart';
import 'Pages/cart_page.dart';
import 'Pages/history_page.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dog Images App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/bottomNavBar': (context) => const BottomNavBar(),
        '/homepage': (context) => HomePage(),
        '/history': (context) => HistoryPage(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}






