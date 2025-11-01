import 'package:flutter/material.dart';

class ProductImageGallery extends StatefulWidget {
  const ProductImageGallery({super.key});

  @override
  State<ProductImageGallery> createState() => _ProductImageGalleryState();
}

class _ProductImageGalleryState extends State<ProductImageGallery> {
  int _selectedImageIndex = 2;

  final List<String> _productImages = [
    'assets/images/products/iphone_desert_thumb.png',
    'assets/images/products/iphone_natural_thumb.png',
    'assets/images/products/iphone_white_thumb.png',
    'assets/images/products/iphone_black_thumb.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMainImage(),
        const SizedBox(height: 16),
        _buildThumbnails(),
      ],
    );
  }

  Widget _buildMainImage() {
    return Container(
      height: 280,
      alignment: Alignment.center,
      child: Image.asset(
        _productImages[_selectedImageIndex],
        height: 250,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.phone_iphone,
              size: 150,
              color: Colors.grey.shade400,
            ),
          );
        },
      ),
    );
  }

  Widget _buildThumbnails() {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
              (index) => _buildThumbnail(index),
        ),
      ),
    );
  }

  Widget _buildThumbnail(int index) {
    final bool isSelected = index == _selectedImageIndex;

    return GestureDetector(
      onTap: () => _onThumbnailTap(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          _productImages[index],
          width: 50,
          height: 50,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade200,
              child: Icon(
                Icons.phone_iphone,
                color: isSelected ? Colors.blue : Colors.grey.shade600,
                size: 30,
              ),
            );
          },
        ),
      ),
    );
  }

  void _onThumbnailTap(int index) {
    setState(() {
      _selectedImageIndex = index;
    });
  }
}