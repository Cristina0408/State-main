import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../application/profile_cubit/profile_cubit.dart';

class ListOptionsSettings extends StatelessWidget {
  const ListOptionsSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        AppBar(
          title: const Text('Configuración'),
        ),
        const SearchBar(hintText: 'Buscar en los ajustes...'),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoadedState) {
              final user = state.user;
    
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.purple[100],
                  child: const Icon(Icons.person, size: 30),
                ),
                title: Text(
                  user.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(
                  user.description,
                  style: const TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  context.go('/profile');
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.key_outlined),
          title: const Text('Cuenta'),
          subtitle: const Text('Notificaciones de seguridad, información de la cuenta'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.lock_outline),
          title: const Text('Privacidad'),
          subtitle: const Text('Contactos bloqueados, mensajes temporales'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.chat_outlined),
          title: const Text('Chats'),
          subtitle: const Text('Tema, fondos, ajustes del chat'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.notifications_outlined),
          title: const Text('Notificaciones'),
          subtitle: const Text('Notificaciones de mensajes'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.keyboard_outlined),
          title: const Text('Atajos del teclado'),
          subtitle: const Text('Acciones rápidas'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.help_outline),
          title: const Text('Ayuda'),
          subtitle: const Text('Centro de ayuda, contáctanos, política de privacidad'),
          onTap: () {},
        ),
        ListTile(
          textColor: Colors.red,
          leading: const Icon(Icons.logout, color: Colors.red,),
          title: const Text('Cerrar sesión'),
          onTap: () {},
        ),
      ],
    );
  }
}
