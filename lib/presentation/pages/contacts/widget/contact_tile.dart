import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../application/chat_cubit/chat_cubit.dart';
import '../../../../domain/entities/contact.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;
  final bool isSelected;

  const ContactTile({
    super.key,
    required this.contact,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            )
          : null,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text(
          contact.name,
          style: const TextStyle(fontSize: 16),
        ),
        subtitle: Text(
          contact.email,
          style: const TextStyle(fontSize: 14),
        ),
        onTap: () {
          context.read<ChatCubit>().selectContact(contact.id);
        },
      ),
    );
  }
}
