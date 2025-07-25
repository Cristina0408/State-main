import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/utils/fake_contacts.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  Future<bool> _loadContacts() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Widget _buildSkeletonItem() {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[300],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos'),
        centerTitle: true,
      ),
      body: FutureBuilder<bool>(
        future: _loadContacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => _buildSkeletonItem(),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: fakeContacts.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final contact = fakeContacts[index];
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(contact.name),
                subtitle: Text(contact.email),
                trailing: IconButton(
                  icon: const Icon(Icons.phone),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Simulando llamada a ${contact.phone}')),
                    );
                  },
                ),
                onTap: () {
                  context.push('/chat/${contact.id}');
                },
              );
            },
          );
        },
      ),
    );
  }
}
