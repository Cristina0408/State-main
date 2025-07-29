import 'package:freezed_annotation/freezed_annotation.dart';
import '../../presentation/pages/chat/widget/chat_message_model.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    required List<ChatMessageModel> messages,
    required String currentInput,
    required Map<String, String> nicknames,
    required Set<String> favorites,
    required Set<String> loadingNicknames,
    required Map<String, bool> notificationsEnabled,
    String? selectedContactId,
  }) = _ChatState;

  factory ChatState.initial() => const ChatState(
    messages: [],
    currentInput: '',
    nicknames: {},
    favorites: {},
    loadingNicknames: {},
    notificationsEnabled: {},
    selectedContactId: null,
  );
}
