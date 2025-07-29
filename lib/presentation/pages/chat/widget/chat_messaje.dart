import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String senderEmail;
  final String currentUserEmail;

  const ChatMessage({
    super.key,
    required this.text,
    required this.senderEmail,
    required this.currentUserEmail,
  });

  @override
  Widget build(BuildContext context) {
    final isMe = senderEmail == currentUserEmail;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: EdgeInsets.only(
          bottom: 5,
          left: isMe ? 100 : 5,
          right: isMe ? 5 : 100,
        ),
        decoration: BoxDecoration(
          color: isMe
              ? const Color.fromARGB(255, 61, 155, 199)
              : Colors.deepPurpleAccent[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
