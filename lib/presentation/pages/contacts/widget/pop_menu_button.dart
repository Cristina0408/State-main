import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../application/chat_cubit/chat_cubit.dart';
import '../../../../application/chat_cubit/chat_state.dart';
import '../../../../domain/entities/contact.dart';

class PopMenuButton extends StatelessWidget {
  final Contact contact;

  const PopMenuButton({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<ChatCubit>(context);
        final isFav = state.favorites.contains(contact.id);
        final notificationsOn = state.notificationsEnabled[contact.id] ?? true;

        return PopupMenuButton<String>(
          tooltip: '',
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.expand_more, size: 20),
          splashRadius: 20,
          enableFeedback: true,
          color: Colors.black87,
          elevation: 4,
          onSelected: (value) {
            if (value == 'favorite') {
              cubit.toggleFavorite(contact.id);
            } else if (value == 'mute') {
              cubit.toggleNotification(contact.id);
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'favorite',
              child: Row(
                children: [
                  Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: Colors.redAccent,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  const Text('Favorito', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'mute',
              child: Row(
                children: [
                  Icon(
                    notificationsOn ? Icons.volume_off : Icons.volume_off_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  const Text('Silenciar', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
