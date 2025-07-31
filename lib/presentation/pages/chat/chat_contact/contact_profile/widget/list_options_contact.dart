import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../application/chat_cubit/chat_cubit.dart';
import '../../../../../../application/chat_cubit/chat_state.dart';

class ListOptionsProfile extends StatelessWidget {
  final String contactId;
  const ListOptionsProfile({super.key, required this.contactId});

  void _showRenameDialog(BuildContext context, String currentName) {
    final controller = TextEditingController(); 
    final isLoading = ValueNotifier<bool>(false);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cargando nuevo apodo'),
        content: ValueListenableBuilder<bool>(
          valueListenable: isLoading,
          builder: (_, loading, __) {
            return loading
            ? const SizedBox(
                height: 60,
                child: Center(child: CircularProgressIndicator()),
              )
            : TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                hintText: currentName.isEmpty ? 'Sin apodo' : currentName,
              ),
            );
          },
        ),
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: isLoading,
            builder: (_, loading, __) => TextButton(
              onPressed: loading
                  ? null
                  : () async {
                      final newName = controller.text.trim();
                      if (newName.isEmpty) return;

                      isLoading.value = true;
                      await context.read<ChatCubit>().updateNickname(contactId, newName);

                      if (context.mounted) {
                        context.pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Apodo actualizado')),
                        );
                      }
                    },
              child: const Text('Renombrar'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        final cubit = context.read<ChatCubit>();
        final currentName = cubit.getNickname(contactId, '');
        final isLoading = cubit.isNicknameLoading(contactId);
        final notificationsOn = cubit.areNotificationsEnabled(contactId);

        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ListTile(
              leading: isLoading
                  ? const CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.transparent,
                      child: SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  : const Icon(Icons.edit),
              title: const Text('Apodos'),
              subtitle: Text(currentName.isEmpty ? 'Sin apodo' : currentName),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showRenameDialog(context, currentName),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications_active_outlined),
              title: const Text('Notificaciones generales'),
              subtitle: Text(notificationsOn ? 'Notificaciones activadas' : 'Notificaciones desactivadas'),
              trailing: Switch(
                value: notificationsOn,
                onChanged: (_) {
                  cubit.toggleNotification(contactId);
                },
              ),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.star),
              title: Text('Mensajes destacados'),
              subtitle: Text('Ver tus mensajes marcados como importantes'),
              trailing: Icon(Icons.chevron_right),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.image),
              title: Text('Imágenes compartidas'),
              subtitle: Text('Ver todas las imágenes del chat'),
              trailing: Icon(Icons.chevron_right),
            ),
          ],
        );
      },
    );
  }
}
