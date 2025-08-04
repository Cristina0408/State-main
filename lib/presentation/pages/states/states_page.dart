import 'package:estado/presentation/widgets/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/chat_cubit/chat_cubit.dart';
import '../../../application/chat_cubit/chat_state.dart';
import '../../../features/utils/fake_contacts.dart';

class StatesPage extends StatelessWidget {
  const StatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novedades'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline), 
            onPressed: () {}),
          MenuButton(
            options: [ 
              MenuOption(
                  value: 'private state',
                  label: 'Estado privado',
                  onTap: () {},
                  icon: Icons.lock_outline,
                ),
              ]
            ),
        ],
      ),
      body: Stack(
        children: [
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14, top: 5),
                      child: Text('Estados',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: const ListTile(
                      leading: CircleAvatar(child: Icon(Icons.person)),
                      title: Text("Mi estado"),
                    ),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(left: 14, top: 10, bottom: 10),
                    child: Text("Recientes",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: fakeContacts.length,
                      itemBuilder: (context, index) {
                        final contact = fakeContacts[index];
                        final nickname = state.nicknames[contact.id] ?? contact.name;
                        return ListTile(
                          leading:
                              const CircleAvatar(child: Icon(Icons.person)),
                          title: Text(nickname),
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  heroTag: 'edit',
                  mini: true,
                  onPressed: () {},
                  child: const Icon(Icons.edit),
                ),
                const SizedBox(height: 12),
                FloatingActionButton(
                  heroTag: 'add',
                  onPressed: () {},
                  child: const Icon(Icons.add_a_photo_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
