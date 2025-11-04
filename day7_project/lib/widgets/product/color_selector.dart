import 'package:flutter/material.dart';

// Widget to display and select different color variants of the product
class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key});

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  // Default selected color
  String _selectedColor = 'White Titanium';

  // List of available colors with display name and visual color
  final List<Map<String, dynamic>> _colors = [
    {'name': 'Desert Titanium', 'color': const Color(0xFFD4C4B0)},
    {'name': 'Natural Titanium', 'color': const Color(0xFFCBCBCB)},
    {'name': 'White Titanium', 'color': const Color(0xFFE8E8E8)},
    {'name': 'Black Titanium', 'color': const Color(0xFF4A4A4A)},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        const Text(
          'Color',
          style: TextStyle(
            fontFamily: 'SF Pro Rounded',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 20),
        _buildColorGrid(), // Display colors in two rows
      ],
    );
  }

  // Creates two rows of color options
  Widget _buildColorGrid() {
    return Column(
      children: [
        // Row 1: Desert & Natural
        Row(
          children: [
            Expanded(child: _buildColorOption(_colors[0]['name'], _colors[0]['color'])),
            const SizedBox(width: 12),
            Expanded(child: _buildColorOption(_colors[1]['name'], _colors[1]['color'])),
          ],
        ),
        const SizedBox(height: 12),
        // Row 2: White & Black
        Row(
          children: [
            Expanded(child: _buildColorOption(_colors[2]['name'], _colors[2]['color'])),
            const SizedBox(width: 12),
            Expanded(child: _buildColorOption(_colors[3]['name'], _colors[3]['color'])),
          ],
        ),
      ],
    );
  }

  // Builds individual color option container
  Widget _buildColorOption(String name, Color color) {
    final bool isSelected = _selectedColor == name;

    return GestureDetector(
      onTap: () => _onColorTap(name),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          children: [
            // Circular color display
            Container(
              width: 40,
              height: 35,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade200, width: 1),
              ),
            ),
            const SizedBox(width: 10),

            // Color name
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontFamily: 'SF Pro Rounded',
                  fontSize: 15,
                  color: isSelected ? Colors.blue : Colors.grey.shade700,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Handles color selection
  void _onColorTap(String color) {
    setState(() {
      _selectedColor = color;
    });
  }
}
