import 'package:flutter/material.dart';

class ButtonContactProfile extends StatelessWidget {
  final Icon icon;
  final String text;

  const ButtonContactProfile({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(150, 90),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        side: BorderSide(color: Colors.grey),
        backgroundColor: Colors.transparent,
      ),
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon.icon, size: 32, color: Colors.purple),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(text, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
