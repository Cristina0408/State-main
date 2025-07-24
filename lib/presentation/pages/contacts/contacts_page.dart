import 'package:flutter/material.dart';
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
        itemCount: contacts.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final contact = contacts[index];
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
    );
  }
}
