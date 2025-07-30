
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/chat_cubit/chat_cubit.dart';
import '../../../../domain/entities/contact.dart';
import 'contact_skeleton.dart';
import 'contact_tile.dart';

class ExpandedContacts extends StatelessWidget {
  const ExpandedContacts({
    super.key,
    required this.isLoading,
    required this.favoriteContacts,
    required this.normalContacts,
  });

  final bool isLoading;
  final List<Contact> favoriteContacts;
  final List<Contact> normalContacts;

 @override
  Widget build(BuildContext context) {
  final selectedId = context.select<ChatCubit, String?>(
    (cubit) => cubit.state.selectedContactId,
  );

  return Expanded(
    child: isLoading
        ? ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: 10,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (_, __) => const ContactSkeleton(),
          )
        : ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (favoriteContacts.isNotEmpty) ...[
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Favoritos',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ...favoriteContacts.map(
                  (contact) => ContactTile(
                    contact: contact,
                    isSelected: contact.id == selectedId,
                  ),
                ),
              ],
              if (normalContacts.isNotEmpty) ...[
                ...normalContacts.map(
                  (contact) => ContactTile(
                    contact: contact,
                    isSelected: contact.id == selectedId,
                  ),
                ),
              ],
            ],
          ),
        );
      }
}
