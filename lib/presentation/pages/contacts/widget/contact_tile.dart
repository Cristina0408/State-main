import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../application/chat_cubit/chat_cubit.dart';
import '../../../../domain/entities/contact.dart';
import 'pop_menu_button.dart';

class ContactTile extends StatefulWidget {
  final Contact contact;
  final bool isSelected;

  const ContactTile({
    super.key,
    required this.contact,
    required this.isSelected,
  });

  @override
  State<ContactTile> createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> with TickerProviderStateMixin {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    final state = cubit.state;
    final nickname = state.nicknames[widget.contact.id] ?? widget.contact.name;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: widget.isSelected
                ? BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  )
                : null,
            child: ListTile(
              selected: widget.isSelected,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      nickname,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                widget.contact.email,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: _isHovered
                  ? Theme(
                      data: Theme.of(context).copyWith(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        canvasColor: Colors.transparent,
                      ),
                      child: PopMenuButton(contact: widget.contact),
                    )
                  : null,
              onTap: () {
                cubit.selectContact(widget.contact.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
