import 'package:estado/domain/entities/contact.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.freezed.dart';

@freezed
abstract class Group with _$Group {
  const factory Group({
    required String id,
    required String name,
    required List<Contact> members,
  }) = _Group;
}

