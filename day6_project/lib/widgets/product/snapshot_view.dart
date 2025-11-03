import 'package:flutter/material.dart';

// Displays product highlights (features) and purchase buttons
class SnapshotView extends StatelessWidget {
  const SnapshotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section heading
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'A Snapshot View',
              style: TextStyle(
                fontFamily: 'SF Pro Rounded',
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Feature 1: Display
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildFeatureItem(
              iconPath: 'assets/icons/display_icon.png',
              text: '4K Ultra HD XDR Display',
            ),
          ),
          const SizedBox(height: 20),

          // Feature 2: Wireless
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildFeatureItem(
              iconPath: 'assets/icons/wireless_icon.png',
              text: 'Wireless Charging System',
            ),
          ),
          const SizedBox(height: 32),

          // Action buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(child: _buildBuyNowButton()), // Outlined button
                const SizedBox(width: 16),
                Expanded(child: _buildAddToCartButton()), // Filled button
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reusable widget for each product feature
  Widget _buildFeatureItem({
    required String iconPath,
    required String text,
  }) {
    return Row(
      children: [
        // Circular icon container
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              iconPath,
              fit: BoxFit.contain,
              color: Colors.grey.shade700,
              errorBuilder: (context, error, stackTrace) {
                // If image is missing, show fallback icon
                print('Error loading image: $iconPath');
                return Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.grey.shade400,
                  size: 20,
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 16),

        // Feature description text
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'SF Pro Rounded',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }

  // "Buy Now" button - outlined style
  Widget _buildBuyNowButton() {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue, width: 2),
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
          ),
        ),
      ),
    );
  }

  // "Add to Cart" button - filled blue style
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
          ),
        ),
      ),
    );
  }
}
