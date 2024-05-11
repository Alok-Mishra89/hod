import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.all(5)),
            const Center(
              child: Text(
                "Welcome to House",
                style: TextStyle(

                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const Center(
              child: Text(
                "of Dogs",
                style: TextStyle(
                    fontSize: 40,
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
                  Navigator.pushReplacementNamed(context, '/bottomNavBar');
                },
                child: const Text(
                  "Let's Go",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
