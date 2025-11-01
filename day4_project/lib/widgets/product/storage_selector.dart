import 'package:flutter/material.dart';

class StorageSelector extends StatefulWidget {
  const StorageSelector({super.key});

  @override
  State<StorageSelector> createState() => _StorageSelectorState();
}

class _StorageSelectorState extends State<StorageSelector> {
  String _selectedStorage = '512 GB';

  final List<String> _storageOptions = ['256 GB', '512 GB', '1 TB'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Storage',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        _buildStorageOptions(),
      ],
    );
  }

  Widget _buildStorageOptions() {
    return Row(
      children: _storageOptions.map((storage) {
        final bool isLast = storage == _storageOptions.last;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: isLast ? 0 : 12),
            child: _buildStorageOption(storage),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStorageOption(String storage) {
    final bool isSelected = _selectedStorage == storage;

    return GestureDetector(
      onTap: () => _onStorageTap(storage),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Center(
          child: Text(
            storage,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.blue : Colors.black87,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  void _onStorageTap(String storage) {
    setState(() {
      _selectedStorage = storage;
    });
  }
}