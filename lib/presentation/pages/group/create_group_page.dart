import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/utils/fake_contacts.dart';
import '../../../application/group_cubit/group_cubit.dart';
import '../../../application/group_cubit/group_state.dart';

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({super.key});

  void _showGroupNameDialog(BuildContext context, GroupCubit cubit) {
    final nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Nombre del grupo'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: 'Ej: Mi Grupo',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              final name = nameController.text.trim();
              if (name.isNotEmpty) {
                cubit.createGroup(name);
                cubit.clearSelection();
                context.go('/groups');
              }
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final groupCubit = context.read<GroupCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Grupo'),
        actions: [
          _CreateGroupButton(
            onPressed: () {
              if (groupCubit.state.selectedContacts.isEmpty) return;
              _showGroupNameDialog(context, groupCubit);
            },
          ),
        ],
      ),
      body: BlocListener<GroupCubit, GroupState>(
        listenWhen: (prev, curr) =>
            prev.group != curr.group && curr.group != null,
        listener: (context, state) {
          // Aquí puedes añadir lógica si necesitas reaccionar a cambios en el grupo
        },
        child: BlocBuilder<GroupCubit, GroupState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: fakeContacts.length,
              itemBuilder: (context, index) {
                final contact = fakeContacts[index];
                final isSelected = state.selectedContacts.contains(contact);

                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(contact.name),
                  trailing: Checkbox(
                    value: isSelected,
                    onChanged: (_) =>
                        context.read<GroupCubit>().toggleContact(contact),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _CreateGroupButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _CreateGroupButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.people_alt_rounded),
            onPressed: onPressed,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const Text('Crear grupo', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
