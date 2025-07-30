import 'package:flutter/material.dart';

class ContactsAppBar extends StatelessWidget {
  const ContactsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.only(top: 8, left: 16, right: 8, bottom: 8),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'WhatsApp',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chat, color: Colors.white),
            onPressed: () {
              
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'settings') {
                
              } else if (value == 'logout') {
              
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem<String>(
                value: 'settings',
                child: Text('Ajustes'),
              ),
              PopupMenuItem<String>(
                value: 'logout',
                child: Text('Cerrar sesión'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
