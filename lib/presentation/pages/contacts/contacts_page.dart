import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../features/utils/fake_contacts.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos'),
        centerTitle: true,
      ),
      body: ListView.separated(
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/profile');
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

