// chat_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_state.dart';
import '../widget/chat_message_model.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatState.initial());

  void updateInput(String input) {
    emit(state.copyWith(currentInput: input));
  }

  void addMessage(String text, String senderEmail) {
    if (text.trim().isEmpty) return;

    final message = ChatMessageModel(
      text: text.trim(),
      senderEmail: senderEmail,
    );

    emit(state.copyWith(
      messages: [message, ...state.messages],
      currentInput: '',
    ));
  }

  void clearMessages() {
    emit(state.copyWith(messages: [], currentInput: ''));
  }
}
