import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/chat_message_model.dart';


class ChatCubit extends Cubit<List<ChatMessageModel>> {
  ChatCubit() : super([]);

  final String storageKey = 'chat_messages';

  Future<void> loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final rawList = prefs.getStringList(storageKey) ?? [];

    final messages = rawList.map((item) {
      final Map<String, dynamic> json = jsonDecode(item);
      return ChatMessageModel.fromJson(json);
    }).toList();

    emit(messages);
  }

  Future<void> addMessage(ChatMessageModel message) async {
    final updatedList = [message, ...state];
    emit(updatedList);

    final prefs = await SharedPreferences.getInstance();
    final rawList = updatedList.map((msg) => jsonEncode(msg.toJson())).toList();
    await prefs.setStringList(storageKey, rawList);
  }

  Future<void> clearMessages() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(storageKey);
    emit([]);
  }
}
