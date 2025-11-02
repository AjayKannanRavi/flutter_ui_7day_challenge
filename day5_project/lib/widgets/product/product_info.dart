import 'package:flutter/material.dart';

// This widget displays key product details such as title, brand, rating, price, and quantity control.
class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),               // Product name
        const SizedBox(height: 12),
        _buildBrandAndRating(),      // Brand and rating details
        const SizedBox(height: 16),
        _buildPriceRow(),            // Price and quantity controls
      ],
    );
  }

  // ------------------------------------------------------
  // SECTION 1: Product Title
  // ------------------------------------------------------
  Widget _buildTitle() {
    return const Text(
      'Iphone 16 Pro Max',           // Product name displayed prominently
      style: TextStyle(
        fontFamily: 'SF Pro Rounded', // Custom font for smooth and modern look
        fontSize: 28,                 // Large font for title emphasis
        fontWeight: FontWeight.w700,  // Bold weight for visual focus
        color: Colors.black,
        height: 1.2,
        letterSpacing: -0.3,
      ),
    );
  }

  // ------------------------------------------------------
  // SECTION 2: Brand and Rating Row
  // Displays brand name, rating stars, and number of reviews
  // ------------------------------------------------------
  Widget _buildBrandAndRating() {
    return Row(
      children: [
        // "By" label (gray text)
        Text(
          'By ',
          style: TextStyle(
            fontFamily: 'SF Pro Rounded',
            fontSize: 15,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w400,
          ),
        ),

        // Brand name (Apple)
        const Text(
          'Apple',
          style: TextStyle(
            fontFamily: 'SF Pro Rounded',
            fontSize: 15,
            color: Colors.blue,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(width: 16),

        // Small circular separator between brand and rating
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
        ),

        const SizedBox(width: 16),

        // Star icon for product rating
        const Icon(
          Icons.star_border,
          color: Colors.amber,
          size: 20,
        ),
        const SizedBox(width: 8),

        // Rating value
        const Text(
          '4.9',
          style: TextStyle(
            fontFamily: 'SF Pro Rounded',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),

        // Number of reviews (in gray)
        Text(
          ' (2.2k)',
          style: TextStyle(
            fontFamily: 'SF Pro Rounded',
            fontSize: 15,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w400,
          ),
        ),

        const SizedBox(width: 6),

        // Chevron icon (indicating possible link to full reviews)
        Icon(
          Icons.chevron_right,
          size: 20,
          color: Colors.grey.shade400,
        ),
      ],
    );
  }

  // ------------------------------------------------------
  // SECTION 3: Price Row
  // Shows discounted price, original price, and quantity control
  // ------------------------------------------------------
  Widget _buildPriceRow() {
    return Row(
      children: [
        // Current discounted price
        const Text(
          '\$1399.99',
          style: TextStyle(
            fontFamily: 'SF Pro Rounded',
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            height: 1.0,
          ),
        ),
        const SizedBox(width: 12),

        // Original price (crossed out)
        Text(
          '\$1499.99',
          style: TextStyle(
            fontFamily: 'SF Pro Rounded',
            fontSize: 18,
            color: Colors.grey.shade400,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.grey.shade500,
            decorationThickness: 2.0,
            fontWeight: FontWeight.w400,
            height: 1.0,
          ),
        ),

        const Spacer(), // Pushes quantity selector to the right
        _buildQuantitySelector(),
      ],
    );
  }

  // Wrapper for quantity selector widget
  Widget _buildQuantitySelector() {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: const _QuantitySelector(), // Custom widget defined below
    );
  }
}

// ------------------------------------------------------
// SECTION 4: Quantity Selector Widget
// Allows user to increase or decrease the product quantity
// ------------------------------------------------------
class _QuantitySelector extends StatefulWidget {
  const _QuantitySelector();

  @override
  State<_QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<_QuantitySelector> {
  int _quantity = 1; // Default quantity set to 1

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Keeps buttons compact
      children: [
        // Decrease button
        _buildButton(
          icon: Icons.remove,
          onTap: _quantity > 1 ? _onDecrease : null, // Disabled if qty = 1
          isPrimary: false,
        ),
        const SizedBox(width: 16),

        // Quantity value display
        Text(
          '$_quantity',
          style: const TextStyle(
            fontFamily: 'SF Pro Rounded',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 16),

        // Increase button
        _buildButton(
          icon: Icons.add,
          onTap: _onIncrease,
          isPrimary: true,
        ),
      ],
    );
  }

  // Reusable method for creating circular + / - buttons
  Widget _buildButton({
    required IconData icon,
    required VoidCallback? onTap,
    required bool isPrimary,
  }) {
    final bool enabled = onTap != null; // Whether button is active

    return GestureDetector(
      onTap: onTap, // Executes tap callback
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isPrimary
                ? Colors.blue // Highlight blue for + button
                : (enabled ? Colors.grey.shade300 : Colors.grey.shade200),
            width: 2,
          ),
          shape: BoxShape.circle, // Circular design
        ),
        child: Center(
          child: Icon(
            icon,
            size: 20,
            color: isPrimary
                ? Colors.blue // Blue color for add button
                : (enabled ? Colors.grey.shade600 : Colors.grey.shade400),
          ),
        ),
      ),
    );
  }

  // Decreases the quantity (minimum 1)
  void _onDecrease() {
    setState(() {
      _quantity--;
    });
  }

  // Increases the quantity
  void _onIncrease() {
    setState(() {
      _quantity++;
    });
  }
}
