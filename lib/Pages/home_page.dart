import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String imageUrl;

  @override
  void initState() {
    super.initState();
    fetchImage();
  }

  Future<void> fetchImage() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        imageUrl = data['message'];
      });
    } else {
      throw Exception('Failed to load image');
    }
  }

  Future addToHistory(String imageUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('history') ?? [];
    history.add(imageUrl);
    prefs.setStringList('history', history);
  }

  Future addToCart(String imageUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cart = prefs.getStringList('cart') ?? [];
    cart.add(imageUrl);
    prefs.setStringList('cart', cart);
  }

  int dogPrice = 7500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: imageUrl.isNotEmpty
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        height: 500,
                        child: Image.network(
                          imageUrl,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Price:  $dogPrice",
                            style: GoogleFonts.acme(fontSize: 30,color: Colors.indigoAccent),
                          ),
                          IconButton(
                              onPressed: () {ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.green,
                                      content:
                                      Text("Your Dog is waiting in Cart")));
                              addToCart(imageUrl);},
                              icon: const Icon(
                                Icons.add_shopping_cart,
                                size: 35,
                                color: Colors.indigoAccent,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 10,
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.indigoAccent),
                        onPressed: () {
                          fetchImage();
                        },
                        child: const Text('Get New Image',
                            style: TextStyle(fontSize: 15)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 10,
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.indigoAccent),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.green,
                                      content:
                                          Text("History added successfully")));
                              addToHistory(imageUrl);
                            },
                            child: const Text('Add to History',
                                style: TextStyle(fontSize: 15)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
