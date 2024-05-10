import 'package:flutter/material.dart';
import 'package:house_of_dogs/Pages/home_page.dart';
import 'package:lottie/lottie.dart';
import 'Pages/cart_page.dart';
import 'Pages/history_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigoAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            const Center(
              child: Text(
                "Welcome to House of Dogs",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 15),
            Lottie.asset('lib/assets/Animation/Dog.json',
                width: 400, height: 400),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const BottomNavBar()));
                },
                child: const Text(
                  "Let's Go",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _bottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [HomePage(), HistoryPage(), const CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("House of Dogs", style: GoogleFonts.abhayaLibre(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white))),
          backgroundColor: Colors.indigoAccent,
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          elevation: 50,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: _bottomNavBar,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.indigoAccent,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "History"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart")
          ],
        ));
  }
}
