import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  factory User({
    required String id,
    required String name,
    required int age,
    required String email,
    required String description,
    required String profileImageUrl,
    required List<String> professionsId
  }) = _User;
}
