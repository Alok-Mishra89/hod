import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Future<List<String>> getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cart = prefs.getStringList('cart') ?? [];
    return cart;
  }

  int dogPrice = 7500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<String>>(
        future: getCart(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<String>? cart = snapshot.data;
            int totalPrice = cart!.length * dogPrice;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          color: Colors.black12,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Image.network(cart[index]),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Price: $dogPrice",
                                      style: GoogleFonts.acme(
                                          fontSize: 30,
                                          color: Colors.indigoAccent)),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        // Remove the item from the cart
                                        cart.removeAt(index);
                                        // Save the updated cart
                                        SharedPreferences.getInstance()
                                            .then((prefs) {
                                          prefs.setStringList('cart', cart);
                                        });
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 35,
                                      color: Colors.indigoAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Total: ${totalPrice.toString()} INR',
                    style: GoogleFonts.acme(
                      fontSize: 20,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}