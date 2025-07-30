import 'package:flutter/material.dart';

class ContactSkeleton extends StatelessWidget {
  const ContactSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
      ),
      title: Container(
        height: 16,
        width: 150,
        color: Colors.grey[300],
      ),
      subtitle: Container(
        height: 14,
        width: 100,
        margin: const EdgeInsets.only(top: 8),
        color: Colors.grey[300],
      ),
      trailing: Container(
        width: 24,
        height: 24,
        color: Colors.grey[300],
      ),
    );
  }
}
