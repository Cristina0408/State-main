import 'package:flutter/material.dart';
import '../../../../application/chat_cubit/chat_cubit.dart';

class InputChat extends StatefulWidget {
  final ChatCubit chatCubit;
  final String contactEmail;
  final bool isBlocked; // nuevo parámetro

  const InputChat({
    super.key,
    required this.chatCubit,
    required this.contactEmail,
    required this.isBlocked,
  });

  @override
  State<InputChat> createState() => _InputChatState();
}

class _InputChatState extends State<InputChat> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _textController.text = widget.chatCubit.state.currentInput;
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSubmit(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;

    if (widget.isBlocked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No puedes enviar mensajes en un chat bloqueado')),
      );
      return;
    }

    FocusScope.of(context).unfocus();
    widget.chatCubit.addMessage(trimmed, widget.contactEmail);

    _textController.clear();
    widget.chatCubit.updateInput('');
    setState(() {});
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isBlocked) {
      return Container(
        padding: const EdgeInsets.all(16),
        color: Colors.red[100],
        child: const Center(
          child: Text(
            'Chat bloqueado',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    final currentInput = widget.chatCubit.state.currentInput;
    final isWriting = currentInput.trim().isNotEmpty;

    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 530),
            child: Container(
              height: 42,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.grey),
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: IconButton(
                      icon: const Icon(Icons.emoji_emotions, color: Colors.grey),
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      focusNode: _focusNode,
                      onChanged: (text) {
                        widget.chatCubit.updateInput(text);
                        setState(() {});
                      },
                      onSubmitted: _handleSubmit,
                      style: const TextStyle(fontSize: 13),
                      decoration: const InputDecoration(
                        hintText: 'Enviar mj:',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                        border: InputBorder.none,
                        isCollapsed: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  if (isWriting)
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.blueAccent),
                      onPressed: () => _handleSubmit(currentInput),
                    )
                  else
                    IconButton(
                      icon: const Icon(Icons.mic, color: Colors.grey),
                      onPressed: () {},
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
