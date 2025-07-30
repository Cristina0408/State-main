import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/chat_cubit/chat_cubit.dart';

import '../widget/chat_messaje.dart';

class ChatGroupPage extends StatefulWidget {
  final String groupId;

  const ChatGroupPage({super.key, required this.groupId});

  @override
  State<ChatGroupPage> createState() => _ChatGroupPageState();
}

class _ChatGroupPageState extends State<ChatGroupPage>
    with TickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();

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
     appBar: AppBar(title: Text('Grupo')),
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
                  currentUserEmail: widget.groupId, 
                );
              },
            ),
          ),
          const Divider(height: 1),
          _buildInputArea(chatCubit),
        ],
      ),
    );
  }

  Widget _buildInputArea(ChatCubit chatCubit) {
    final isWriting = chatCubit.state.currentInput.trim().isNotEmpty;

    return SafeArea(
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _textController,
                onChanged: chatCubit.updateInput,
                onSubmitted: _handleSubmit,
                focusNode: _focusNode,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Escribí tu mensaje...',
                ),
              ),
            ),
            _buildSendButton(isWriting, chatCubit),
          ],
        ),
      ),
    );
  }

  Widget _buildSendButton(bool isWriting, ChatCubit chatCubit) {
    void send() {
      _handleSubmit(chatCubit.state.currentInput);
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      child: !kIsWeb && Platform.isIOS
          ? CupertinoButton(
              onPressed: isWriting ? send : null,
              child: const Text('Enviar'),
            )
          : IconButton(
              icon: const Icon(Icons.send),
              onPressed: isWriting ? send : null,
              color: Colors.blue,
            ),
    );
  }

  void _handleSubmit(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;

    FocusScope.of(context).unfocus();
    context.read<ChatCubit>().addMessage(trimmed, widget.groupId);

    _textController.clear();
    context.read<ChatCubit>().updateInput('');
    _focusNode.requestFocus();
  }
}
