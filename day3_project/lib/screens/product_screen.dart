import 'package:flutter/material.dart';
import '../widgets/product/product_header.dart';
import '../widgets/product/product_image_gallery.dart';
import '../widgets/product/product_info.dart';
import '../widgets/product/color_selector.dart';
import '../widgets/product/storage_selector.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductHeader(),
              const SizedBox(height: 20),
              const ProductImageGallery(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ProductInfo(), // Quantity selector is inside here now
                    SizedBox(height: 24),
                    ColorSelector(),
                    SizedBox(height: 20),
                    StorageSelector(),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}