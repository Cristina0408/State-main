import 'package:freezed_annotation/freezed_annotation.dart';
import '../widget/chat_message_model.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    required List<ChatMessageModel> messages,
    required String currentInput,
  }) = _ChatState;

  factory ChatState.initial() => const ChatState(
    messages: [],
    currentInput: '',
  );
}
