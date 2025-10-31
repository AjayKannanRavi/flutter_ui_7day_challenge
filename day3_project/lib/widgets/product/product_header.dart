import 'package:flutter/material.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconButton('assets/icons/back.png'),
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

  Widget _buildIconButton(String imagePath) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(8),
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }
}