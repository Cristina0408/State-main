import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/chat_cubit/chat_cubit.dart';
import '../../../application/chat_cubit/chat_state.dart';
import '../../../application/search_cubit/search_panel_cubit.dart';
import '../chat/chat_contact/widget/search_panel.dart';
import 'widgets/list_options_settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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


        return Scaffold(
          body: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {

              return Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ListOptionsSettings(),
                  ),
                  const VerticalDivider(width: 1, thickness: 1),
                  Expanded(
                    flex: 3, 
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.settings, size: 90, color: Colors.grey,),
                            const Text('Ajustes', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                          ],
                        ),
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

