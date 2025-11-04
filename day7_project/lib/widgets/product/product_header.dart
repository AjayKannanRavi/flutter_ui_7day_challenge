import 'package:flutter/material.dart';

// Top header bar that includes back, heart (favorite), share, and cart icons
class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: Back and Heart button
          Row(
            children: [
              _buildIconButton('assets/icons/back.png'),
            ],
          ),
          // Right side: Share and Cart buttons
          Row(
            children: [
              _buildIconButton('assets/icons/heart.png'),
              const SizedBox(width: 12),
              _buildIconButton('assets/icons/share.png'),
              const SizedBox(width: 12),
              _buildIconButton('assets/icons/cart.png'),
            ],
          ),
        ],
      ),
    );
  }

  // Helper widget that creates a circular icon button
  Widget _buildIconButton(String imagePath) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          IconData icon;
          if (imagePath.contains('back')) {
            icon = Icons.arrow_back;
          } else if (imagePath.contains('heart')) {
            icon = Icons.favorite_border;
          } else if (imagePath.contains('share')) {
            icon = Icons.share_outlined;
          } else {
            icon = Icons.shopping_cart_outlined;
          }
          return Icon(
            icon,
            size: 20,
            color: Colors.black,
          );
        },
      ),
    );
  }
}
