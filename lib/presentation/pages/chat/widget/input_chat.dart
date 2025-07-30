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
    setState(() {});  // Para actualizar el icono
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
            constraints: const BoxConstraints(maxWidth: 495),
            child: Container(
              height: 42,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.purple[700]!, width: 1),
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
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      focusNode: _focusNode,
                      onChanged: (text) {
                        widget.chatCubit.updateInput(text);
                        setState(() {});  // Para refrescar el icono cuando se escribe
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
                  IconTheme(
                    data: const IconThemeData(color: Colors.purple, size: 25),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Icon(isWriting ? Icons.send : Icons.mic),
                      onPressed: isWriting
                          ? () => _handleSubmit(currentInput)
                          : () {
                            },
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
