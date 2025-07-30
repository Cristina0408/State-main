import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/group_cubit/group_cubit.dart';
import '../../../application/group_cubit/group_state.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupCubit, GroupState>(
      builder: (context, state) {
        final groups = state.groups;

        return Scaffold(
          appBar: AppBar(title: const Text('Lista de Grupos')),
          body: groups.isEmpty
              ? Center(
                  child: IconButton(
                    onPressed: () {
                      context.push('/create-group');
                    },
                    icon: Icon(Icons.person_add),
                  ),
                )
              : ListView.builder(
                  itemCount: groups.length,
                  itemBuilder: (context, index) {
                    final group = groups[index];
                    return ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.group)),
                      title: Text(group.name),
                      subtitle: Text('Miembros: ${group.members.length}'),
                      onTap: () => context.push('/chat-group/${group.id}'),
                    );
                  },
                ),
        );
      },
    );
  }
}
