import '../../../domain/entities/contact.dart';
import '../../../domain/entities/group.dart';

class GroupState {
  final List<Contact> selectedContacts;
  final List<Group> groups;
  final Group? group;

  GroupState({
    this.selectedContacts = const [],
    this.groups = const [],
    this.group,
  });

  GroupState copyWith({
    List<Contact>? selectedContacts,
    List<Group>? groups,
    Group? group,
  }) {
    return GroupState(
      selectedContacts: selectedContacts ?? this.selectedContacts,
      groups: groups ?? this.groups,
      group: group,
    );
  }
}
