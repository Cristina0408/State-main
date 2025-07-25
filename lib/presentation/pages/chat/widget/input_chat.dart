import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/chat_cubit.dart';

class InputChat extends StatelessWidget {
  final TextEditingController textController;
  final FocusNode focusNode;
  final String senderEmail;

  const InputChat({
    super.key,
    required this.textController,
    required this.focusNode,
    required this.senderEmail,
  });

  @override
  Widget build(BuildContext context) {
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
                controller: textController,
                onChanged: (text) => chatCubit.updateInput(text),
                onSubmitted: (text) => _handleSubmit(context, text),
                decoration: const InputDecoration.collapsed(
                  hintText: 'Enviar mensaje...',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                focusNode: focusNode,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: !kIsWeb && Platform.isIOS
                  ? CupertinoButton(
                      onPressed: isWriting
                          ? () => _handleSubmit(context, currentInput)
                          : null,
                      child: const Text('Enviar'),
                    )
                  : IconTheme(
                      data: const IconThemeData(color: Colors.blue),
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: isWriting
                            ? () => _handleSubmit(context, currentInput)
                            : null,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit(BuildContext context, String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;

    FocusScope.of(context).unfocus();
    context.read<ChatCubit>().addMessage(trimmed, senderEmail);

    textController.clear();
    context.read<ChatCubit>().updateInput('');
    focusNode.requestFocus();
  }
}
