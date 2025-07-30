import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/contact.dart';
import '../../../../features/utils/fake_contacts.dart';
import '../../../../application/chat_cubit/chat_cubit.dart';

import '../widget/input_chat.dart';
import 'widget/chat_app_bar.dart';
import '../widget/chat_messaje.dart';

class ChatContactPage extends StatefulWidget {
  final String contactId;

  const ChatContactPage({super.key, required this.contactId});

  @override
  State<ChatContactPage> createState() => _ChatContactPageState();
}

class _ChatContactPageState extends State<ChatContactPage>
    with TickerProviderStateMixin {
  late final Contact contact;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    contact = fakeContacts.firstWhere(
      (c) => c.id == widget.contactId,
      orElse: () => Contact(id: '0', name: 'Desconocido', email: '', phone: ''),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatCubit = context.watch<ChatCubit>();
    final messages = chatCubit.state.messages;

    return Scaffold(
      appBar: ChatAppBar(contact: contact),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: messages.length,
              reverse: true,
              itemBuilder: (_, i) {
                final message = messages[i];
                return ChatMessage(
                  text: message.text,
                  senderEmail: message.senderEmail,
                  currentUserEmail: contact.email,
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
            child: InputChat(
              chatCubit: context.read<ChatCubit>(),
              contactEmail: contact.email,
            ),
          ),
        ],
      ),
    );
  }
}
