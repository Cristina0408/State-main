import 'package:flutter/material.dart';

class MenuOption {
  final String value;
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  MenuOption({
    required this.value,
    required this.label,
    required this.icon,
    required this.onTap,
  });
}

class MenuButton extends StatelessWidget {
  final List<MenuOption> options;

  const MenuButton({
    super.key,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        final option = options.firstWhere((opt) => opt.value == value);
        option.onTap();
      },
      itemBuilder: (BuildContext context) {
        return options.map((option) {
          return PopupMenuItem<String>(
            value: option.value,
            child: Row(
              children: [
                Icon(option.icon, size: 20),
                Text(option.label),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
