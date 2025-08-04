import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/pages/chat/widget/chat_message_model.dart';
import 'chat_state.dart';

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

    emit(
      state.copyWith(messages: [message, ...state.messages], currentInput: ''),
    );
  }

  void clearMessages() {
    emit(state.copyWith(messages: [], currentInput: ''));
  }

  Future<void> updateNickname(String contactId, String newName) async {
    final loading = {...state.loadingNicknames}..add(contactId);
    emit(state.copyWith(loadingNicknames: loading));

    await Future.delayed(const Duration(seconds: 2));

    final newMap = Map<String, String>.from(state.nicknames);
    newMap[contactId] = newName.trim().isEmpty ? 'Agrega un apodo' : newName.trim();

    final updatedLoading = {...state.loadingNicknames}..remove(contactId);

    emit(state.copyWith(nicknames: newMap, loadingNicknames: updatedLoading));
  }

  String getNickname(String contactId, String defaultName) {
    return state.nicknames[contactId] ?? defaultName;
  }

  bool isNicknameLoading(String contactId) {
    return state.loadingNicknames.contains(contactId);
  }

  bool areNotificationsEnabled(String contactId) {
    return state.notificationsEnabled[contactId] ?? true;
  }

  void toggleNotification(String contactId) {
    final current = areNotificationsEnabled(contactId);
    final newMap = Map<String, bool>.from(state.notificationsEnabled);
    newMap[contactId] = !current;
    emit(state.copyWith(notificationsEnabled: newMap));
  }

  void toggleFavorite(String contactId) {
    final newFavorites = Set<String>.from(state.favorites);
    if (newFavorites.contains(contactId)) {
      newFavorites.remove(contactId);
    } else {
      newFavorites.add(contactId);
    }
    emit(state.copyWith(favorites: newFavorites));
  }

  bool isFavorite(String contactId) {
    return state.favorites.contains(contactId);
  }

  void selectContact(String contactId) {
    emit(state.copyWith(selectedContactId: contactId));
  }

  void blockChat(String contactId) {
    final updated = Set<String>.from(state.blockedChats)..add(contactId);
    emit(state.copyWith(blockedChats: updated));
  }

  void unblockChat(String contactId) {
    final updated = Set<String>.from(state.blockedChats)..remove(contactId);
    emit(state.copyWith(blockedChats: updated));
  }

  bool isChatBlocked(String contactId) {
    return state.blockedChats.contains(contactId);
  }

}
