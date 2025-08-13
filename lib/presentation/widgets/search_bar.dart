import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hintText;

  const SearchBar({
    super.key,
    this.controller,
    this.onChanged, 
    required this.hintText,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isFocused ? Colors.purple : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: TextField(
          focusNode: _focusNode,
          controller: widget.controller,
          onChanged: widget.onChanged,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            icon: const Icon(Icons.search, color: Colors.grey),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
