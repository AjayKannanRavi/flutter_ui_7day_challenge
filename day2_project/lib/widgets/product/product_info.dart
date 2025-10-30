import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        const SizedBox(height: 8),
        _buildBrandAndRating(),
        const SizedBox(height: 16),
        _buildPrice(),
      ],
    );
  }

  Widget _buildTitle() {
    return const Text(
      'Iphone 16 Pro Max',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildBrandAndRating() {
    return Row(
      children: [
        const Text(
          'By ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const Text(
          'Apple',
          style: TextStyle(
            fontSize: 14,
            color: Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 16),
        _buildRating(),
      ],
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        const SizedBox(width: 4),
        const Text(
          '4.9',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          ' (2.2k)',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const Icon(
          Icons.chevron_right,
          size: 18,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildPrice() {
    return Row(
      children: [
        const Text(
          '\$1399.99',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '\$1499.99',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade400,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}