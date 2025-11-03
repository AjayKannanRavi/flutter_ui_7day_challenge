import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// The root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: const ProductScreen(), // Launches the ProductScreen
    );
  }
}

/// The main screen displaying the product header section
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // Ensures UI is rendered within safe screen area (avoids notches)
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 🔹 Left-side Back Button
              _buildImageButton('assets/icons/back.png'),
              _buildImageButton('assets/icons/heart.png'),

              // 🔹 Right-side Action Icons → Heart → Share → Cart
              Row(
                children: [
                  const SizedBox(width: 12),
                  _buildImageButton('assets/icons/share.png'),
                  const SizedBox(width: 12),
                  _buildImageButton('assets/icons/cart.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Reusable widget for circular icon buttons with images
  Widget _buildImageButton(String imagePath) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.grey.shade100, // Light background for button
        shape: BoxShape.circle, // 🔹 Makes it a perfect circle
      ),
      padding: const EdgeInsets.all(8), // Inner padding for the icon
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain, // Ensures image fits properly inside
      ),
    );
  }
}
