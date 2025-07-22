import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final String label;
  final String value;

  const ProfileListTile({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: RichText(
        text: TextSpan(
          text: '$label: ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
