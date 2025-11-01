import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        const SizedBox(height: 12),
        _buildBrandAndRating(),
        const SizedBox(height: 16),
        _buildPriceRow(),
      ],
    );
  }

  Widget _buildTitle() {
    return const Text(
      'Iphone 16 Pro Max',
      style: TextStyle(
        fontFamily: 'SF Pro Rounded',
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: Colors.black,
        height: 1.2,
        letterSpacing: -0.3,
      ),
    );
  }

  Widget _buildBrandAndRating() {
    return Row(
      children: [
        Text(
          'By ',
          style: TextStyle(
            fontFamily: 'SF Pro Rounded',
            fontSize: 15,
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Text(
          'Apple',
          style: TextStyle(
            fontFamily: 'SF Pro Rounded',
            fontSize: 15,
            color: Colors.blue,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        const SizedBox(width: 6),
        const Text(
          '4.9',
          style: TextStyle(
            fontFamily: 'SF Pro Rounded',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Text(
          ' (2.2k)',
          style: TextStyle(
            fontFamily: 'SF Pro Rounded',
            fontSize: 15,
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 4),
        const Icon(
          Icons.chevron_right,
          size: 20,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildPriceRow() {
    return Row(
      children: [
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
        Text(
          '\$1499.99',
          style: TextStyle(
            fontFamily: 'SF Pro Rounded',
            fontSize: 18,
            color: Colors.grey.shade400,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.grey.shade400,
            fontWeight: FontWeight.w400,
            height: 1.0,
          ),
        ),
        const Spacer(),
        _buildQuantitySelector(),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: const _QuantitySelector(),
    );
  }
}

class _QuantitySelector extends StatefulWidget {
  const _QuantitySelector();

  @override
  State<_QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<_QuantitySelector> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildButton(
          icon: Icons.remove,
          onTap: _quantity > 1 ? _onDecrease : null,
          isPrimary: false,
        ),
        const SizedBox(width: 16),
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
        _buildButton(
          icon: Icons.add,
          onTap: _onIncrease,
          isPrimary: true,
        ),
      ],
    );
  }

  Widget _buildButton({
    required IconData icon,
    required VoidCallback? onTap,
    required bool isPrimary,
  }) {
    final bool enabled = onTap != null;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isPrimary ? Colors.blue : Colors.white,
          border: Border.all(
            color: isPrimary
                ? Colors.blue
                : (enabled ? Colors.grey.shade300 : Colors.grey.shade200),
            width: isPrimary ? 0 : 1.5,
          ),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            size: 20,
            color: isPrimary
                ? Colors.white
                : (enabled ? Colors.grey.shade600 : Colors.grey.shade400),
          ),
        ),
      ),
    );
  }

  void _onDecrease() {
    setState(() {
      _quantity--;
    });
  }

  void _onIncrease() {
    setState(() {
      _quantity++;
    });
  }
}