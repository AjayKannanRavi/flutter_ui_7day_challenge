import 'package:flutter/material.dart';
import '../widgets/product/product_header.dart';
import '../widgets/product/product_image_gallery.dart';
import '../widgets/product/product_info.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductHeader(),
            const SizedBox(height: 20),
            const ProductImageGallery(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const ProductInfo(),
            ),
          ],
        ),
      ),
    );
  }
}