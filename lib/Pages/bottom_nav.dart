import 'package:flutter/material.dart';
import 'package:house_of_dogs/Pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cart_page.dart';
import 'history_page.dart';

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
          title: Center(
              child: Text("House of Dogs",
                  style: GoogleFonts.abhayaLibre(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white))),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "History"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart")
          ],
        ));
  }
}
