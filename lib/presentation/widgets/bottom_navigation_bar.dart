import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationBar extends StatelessWidget {
  final Widget child;

  const NavigationBar({
    super.key, 
    required this.child
    });
  
  int _locationToIndex(String location) {
    if (location.startsWith('/profile')) return 0;
    if (location.startsWith('/contacts')) return 1;
    if (location.startsWith('/theme')) return 2;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/profile');
        break;
      case 1:
        context.go('/contacts');
        break;
      case 2:
        context.go('/theme');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _locationToIndex(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Contactos'),
          BottomNavigationBarItem(icon: Icon(Icons.color_lens), label: 'Tema'),
        ],
      ),
    );
  }
}
