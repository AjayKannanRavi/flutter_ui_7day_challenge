import 'package:flutter/material.dart';
import 'screens/product_screen.dart';

// Entry point of the Flutter application
void main() {
  runApp(const MyApp());
}

// Root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes debug banner
      theme: ThemeData(
        // Applying a rounded system font for a modern UI look
        fontFamily: 'SF Pro Rounded',

        // Setting a blue color theme across the app
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
        ),
        useMaterial3: true, // Enables latest Material Design version
      ),

      // The main screen of the app
      home: const ProductScreen(),
    );
  }
}
