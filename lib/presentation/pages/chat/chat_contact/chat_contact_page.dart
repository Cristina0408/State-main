import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/contact.dart';
import '../../../../features/utils/fake_contacts.dart';
import '../../../../application/chat_cubit/chat_cubit.dart';

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
          const Divider(height: 2),
          SizedBox(height: 50, child: _inputChat()),
        ],
      ),
    );
  }

  Widget _inputChat() {
    final chatCubit = context.watch<ChatCubit>();
    final currentInput = chatCubit.state.currentInput;
    final isWriting = currentInput.trim().isNotEmpty;

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onChanged: (text) => chatCubit.updateInput(text),
                onSubmitted: _handleSubmit,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Enviar mj:',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                focusNode: _focusNode,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: !kIsWeb && Platform.isIOS
                  ? CupertinoButton(
                      onPressed: isWriting
                          ? () => _handleSubmit(chatCubit.state.currentInput)
                          : null,
                      child: const Text('Enviar'),
                    )
                  : IconTheme(
                      data: const IconThemeData(color: Colors.blue),
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: isWriting
                            ? () => _handleSubmit(chatCubit.state.currentInput)
                            : null,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;

    FocusScope.of(context).unfocus();
    context.read<ChatCubit>().addMessage(trimmed, contact.email);

    _textController.clear();
    context.read<ChatCubit>().updateInput('');
    _focusNode.requestFocus();
  }
}
