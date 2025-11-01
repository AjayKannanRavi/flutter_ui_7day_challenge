import 'package:flutter/material.dart';

class SnapshotView extends StatelessWidget {
  const SnapshotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'A Snapshot View',
            style: TextStyle(
              fontFamily: 'SF Pro Rounded',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 20),
          _buildFeatureItem(
            iconPath: 'assets/icons/display_icon.png',
            text: '4K Ultra HD XDR Display',
          ),
          const SizedBox(height: 16),
          _buildFeatureItem(
            iconPath: 'assets/icons/wireless_icon.png',
            text: 'Wireless Charging System',
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _buildBuyNowButton(),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: _buildAddToCartButton(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required String iconPath,
    required String text,
  }) {
    return Row(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              iconPath,
              fit: BoxFit.contain,
              color: Colors.grey.shade600,
              errorBuilder: (context, error, stackTrace) {
                // Fallback icon if image not found
                print('Error loading image: $iconPath');
                return Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.grey.shade400,
                  size: 28,
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'SF Pro Rounded',
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
              letterSpacing: -0.2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBuyNowButton() {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(27),
      ),
      child: const Center(
        child: Text(
          'Buy Now',
          style: TextStyle(
            fontFamily: 'SF Pro Rounded',
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.blue,
            letterSpacing: -0.2,
          ),
        ),
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(27),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'Add to Cart',
          style: TextStyle(
            fontFamily: 'SF Pro Rounded',
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: -0.2,
          ),
        ),
      ),
    );
  }
}