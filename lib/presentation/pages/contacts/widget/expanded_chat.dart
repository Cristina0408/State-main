import 'package:flutter/material.dart';
import '../../chat/chat_contact/chat_contact_page.dart';

class ChatSection extends StatelessWidget {
  final String? selectedContactId;

  const ChatSection({
    super.key,
    required this.selectedContactId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: selectedContactId == null
        ? Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
              'assets/images/logo.webp',
                width: 180,
                height: 180,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              const Text(
                'Selecciona un chat',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        )
        : ChatContactPage(
            contactId: selectedContactId!,
            key: ValueKey(selectedContactId),
      ),
    );
  }
}
