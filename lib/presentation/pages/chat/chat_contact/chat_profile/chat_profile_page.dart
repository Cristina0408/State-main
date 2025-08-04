import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../application/chat_cubit/chat_state.dart';
import '../../../../../domain/entities/contact.dart';
import '../../../../../application/chat_cubit/chat_cubit.dart';
import 'widget/button_contact_profile.dart';
import 'widget/list_options_contact.dart';

class ContactProfilePage extends StatelessWidget {
  final Contact contact;

  const ContactProfilePage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        final displayName = state.nicknames[contact.id] ?? contact.name;

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double top = constraints.biggest.height;
                    final bool collapsed =
                        top <=
                        kToolbarHeight +
                            MediaQuery.of(context).padding.top +
                            10;

                    return FlexibleSpaceBar(
                      centerTitle: true,
                      title: collapsed
                          ? Padding(
                              padding: const EdgeInsets.only(left: 54, top: 15),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.grey,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    displayName,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            )
                          : null,
                      background: Container(
                        alignment: Alignment.center,
                        child: SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 100,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 6),
                        child: Text(
                          displayName,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          contact.phone,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          ButtonContactProfile(
                            icon: Icon(Icons.phone),
                            text: 'Llamada',
                          ),
                          ButtonContactProfile(
                            icon: Icon(Icons.videocam),
                            text: 'Video',
                          ),
                          ButtonContactProfile(
                            icon: Icon(Icons.search),
                            text: 'Buscar',
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 50),
                        child: ListOptionsProfile(contactId: contact.id),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
