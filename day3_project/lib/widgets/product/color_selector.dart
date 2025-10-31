import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key});

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  String _selectedColor = 'White Titanium';

  final List<Map<String, dynamic>> _colors = [
    {
      'name': 'Desert Titanium',
      'color': const Color(0xFFE8D7C8),
    },
    {
      'name': 'Natural Titanium',
      'color': const Color(0xFFD4D4D4),
    },
    {
      'name': 'White Titanium',
      'color': const Color(0xFFF5F5F5),
    },
    {
      'name': 'Black Titanium',
      'color': const Color(0xFF3D3D3D),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        _buildColorGrid(),
      ],
    );
  }

  Widget _buildColorGrid() {
    return Column(
      children: [
        // First row: Desert and Natural
        Row(
          children: [
            Expanded(
              child: _buildColorOption(
                _colors[0]['name'],
                _colors[0]['color'],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildColorOption(
                _colors[1]['name'],
                _colors[1]['color'],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Second row: White and Black
        Row(
          children: [
            Expanded(
              child: _buildColorOption(
                _colors[2]['name'],
                _colors[2]['color'],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildColorOption(
                _colors[3]['name'],
                _colors[3]['color'],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildColorOption(String name, Color color) {
    final bool isSelected = _selectedColor == name;

    return GestureDetector(
      onTap: () => _onColorTap(name),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? Colors.blue : Colors.black87,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onColorTap(String color) {
    setState(() {
      _selectedColor = color;
    });
  }
}