import 'package:flutter/material.dart' hide SearchBar;
import '../../../../widgets/search_bar.dart';

class SearchPanel extends StatelessWidget {
  const SearchPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Buscar mensajes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SearchBar(hintText: 'Buscar...',),
        ],
      ),
    );
  }
}
