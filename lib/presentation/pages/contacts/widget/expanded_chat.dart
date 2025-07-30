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
                color: Colors.purple[700],
                colorBlendMode: BlendMode.srcIn,
              ),
              
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
