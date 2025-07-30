import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/group.dart';
import '../../../domain/entities/contact.dart';
import 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  GroupCubit() : super(GroupState());

  void toggleContact(Contact contact) {
    final selected = List<Contact>.from(state.selectedContacts);
    selected.contains(contact) ? selected.remove(contact) : selected.add(contact);
    emit(state.copyWith(selectedContacts: selected));
  }

  void createGroup(String name) {
    if (state.selectedContacts.isEmpty) return;

    final ids = state.selectedContacts.map((c) => c.id).toList()..sort();
    final groupId = ids.join('_');

    final newGroup = Group(id: groupId, name: name, members: state.selectedContacts);

    final updatedGroups = List<Group>.from(state.groups)..add(newGroup);

    emit(state.copyWith(groups: updatedGroups, group: newGroup));
  }

  void clearSelection() {
    emit(state.copyWith(selectedContacts: [], group: null));
  }
}
