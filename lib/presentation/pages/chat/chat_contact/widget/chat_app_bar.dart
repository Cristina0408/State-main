import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../application/chat_cubit/chat_cubit.dart';
import '../../../../../application/chat_cubit/chat_state.dart';
import '../../../../../domain/entities/contact.dart';
import '../../../../widgets/menu_button.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key, required this.contact});

  final Contact contact;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        final displayName = state.nicknames[contact.id] ?? contact.name;

        return AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white, size: 15),
              ),
              TextButton(
                onPressed: () {
                  context.pushNamed(
                    'profile_contact',
                    pathParameters: {'id': contact.id},
                    extra: contact,
                  );
                },
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                ),
                child: Text(displayName, style: const TextStyle(fontSize: 18)),
              ),
            ],
          ),
          elevation: 3,
          actions: [
            MenuButton(
              options: [
                MenuOption(
                  value: 'close chat', 
                  label: 'Cerrar chat',
                  onTap: () {
                  },
                  icon: Icons.remove_circle_outline_outlined),
                MenuOption(
                  value: 'blockade',
                  label: 'Bloquear',
                  onTap: () {}, 
                  icon: Icons.person_off_outlined,
                ),
                MenuOption(
                  value: 'delete',
                  label: 'Eliminar chat',
                  onTap: () {
                    context.read<ChatCubit>().clearMessages();
                  }, icon: Icons.delete),
              ],
            ),
          ],
        );
      },
    );
  }
}
