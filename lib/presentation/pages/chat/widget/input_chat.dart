import 'package:flutter/material.dart';
import '../../../../application/chat_cubit/chat_cubit.dart';

class InputChat extends StatefulWidget {
  final ChatCubit chatCubit;
  final String contactEmail;

  const InputChat({
    super.key,
    required this.chatCubit,
    required this.contactEmail,
  });

  @override
  State<InputChat> createState() => _InputChatState();
}

class _InputChatState extends State<InputChat> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isMicPressed = false;

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

    FocusScope.of(context).unfocus();
    widget.chatCubit.addMessage(trimmed, widget.contactEmail);

    _textController.clear();
    widget.chatCubit.updateInput('');
    setState(() {});
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final currentInput = widget.chatCubit.state.currentInput;
    final isWriting = currentInput.trim().isNotEmpty;

    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 550),
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
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                      ),
                    ),
                  ),
                  isWriting
                      ? IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.send, color: Colors.purple),
                          onPressed: () => _handleSubmit(currentInput),
                        )
                      : GestureDetector(
                          onTapDown: (_) {
                            setState(() {
                              _isMicPressed = true;
                            });
                          },
                          onTapUp: (_) {
                            setState(() {
                              _isMicPressed = false;
                            });
                          },
                          onTapCancel: () {
                            setState(() {
                              _isMicPressed = false;
                            });
                          },
                          child: Icon(
                            Icons.mic,
                            color: _isMicPressed ? Colors.purple : Colors.grey,
                            size: 25,
                          ),
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
