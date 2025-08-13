import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/chat_cubit/chat_cubit.dart';
import '../../../application/chat_cubit/chat_state.dart';
import '../../../features/utils/fake_contacts.dart';
import '../../widgets/search_bar.dart';
import '../../../application/search_cubit/search_panel_cubit.dart';
import '../chat/chat_contact/widget/search_panel.dart';
import 'widget/contact_appbar.dart';
import 'widget/expanded_chat.dart';
import 'widget/expanded_contact.dart';
import 'widget/three_buttons.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late final Future<void> _loadingFuture;

  @override
  void initState() {
    super.initState();
    _loadingFuture = _simulateLoadContacts();
  }

  Future<void> _simulateLoadContacts() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadingFuture,
      builder: (context, snapshot) {
        final isLoading = snapshot.connectionState != ConnectionState.done;

        return Scaffold(
          body: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              final cubit = context.read<ChatCubit>();

              final favoriteContacts = fakeContacts
                  .where((c) => cubit.isFavorite(c.id))
                  .toList();
              final normalContacts = fakeContacts
                  .where((c) => !cubit.isFavorite(c.id))
                  .toList();

              return Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        const ContactsAppBar(),
                        const SearchBar(hintText: 'Buscar un chat...',),
                        ThreeButtons(
                          onFirstPressed: () {},
                          onSecondPressed: () {},
                          onThirdPressed: () {},
                          firstLabel: 'Todos',
                          secondLabel: 'No leidos',
                          thirdLabel: 'Favoritos',
                        ),
                        ExpandedContacts(
                          isLoading: isLoading,
                          favoriteContacts: favoriteContacts,
                          normalContacts: normalContacts,
                        ),
                      ],
                    ),
                  ),
                  const VerticalDivider(width: 1, thickness: 1),
                  Expanded(
                    flex: 3,
                    child: ExpandedChat(
                      selectedContactId: state.selectedContactId,
                    ),
                  ),
                        const VerticalDivider(width: 1, thickness: 1),
                  BlocBuilder<SearchPanelCubit, bool>(
                  builder: (context, showSearch) {
                    return showSearch
                        ? const Expanded(flex: 2, child: SearchPanel())
                        : const SizedBox.shrink();
                  },
                ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
