import 'package:flutter/material.dart';
import '../widgets/product/product_header.dart';
import '../widgets/product/product_image_gallery.dart';
import '../widgets/product/product_info.dart';
import '../widgets/product/color_selector.dart';
import '../widgets/product/storage_selector.dart';
import '../widgets/product/snapshot_view.dart';

// Represents the overall layout of the product detail page
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      body: SafeArea( // Keeps UI safe from notches/status bars
        child: SingleChildScrollView( // Allows vertical scrolling
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const ProductHeader(), // Top bar with icons
              const SizedBox(height: 20),
              const ProductImageGallery(), // Product image viewer
              const SizedBox(height: 24),

              // Padding to provide consistent spacing for details section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ProductInfo(),       // Product name, price, etc.
                    SizedBox(height: 28),
                    ColorSelector(),     // Color selection section
                    SizedBox(height: 28),
                    StorageSelector(),   // Storage selection buttons
                    SizedBox(height: 32),
                    SnapshotView(),      // “Buy Now” & “Add to Cart” buttons
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
