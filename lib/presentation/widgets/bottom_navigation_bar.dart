import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationBar extends StatelessWidget {
  final Widget child;
  final String currentLocation;

  const NavigationBar({
    super.key,
    required this.child,
    required this.currentLocation,
  });

  int _locationToIndex(String location) {
    if (location.startsWith('/contacts')) return 0;
    if (location.startsWith('/states')) return 1;
    if (location.startsWith('/groups')) return 2;
    if (location.startsWith('/theme')) return 3;
    if (location.startsWith('/settings')) return 4;
    if (location.startsWith('/profile')) return 5;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/contacts');
        break;
      case 1:
        context.go('/states');
        break;
      case 2:
        context.go('/groups');
        break;
      case 3:
        context.go('/theme');
        break;
      case 4:
        context.go('/settings');
        break;
      case 5:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _locationToIndex(currentLocation);

    return Scaffold(
      body: Row(
        children: [
            NavigationRailTheme(
            data: NavigationRailThemeData(
              minWidth: 56,
              indicatorColor: Colors.transparent,
              selectedIconTheme: IconThemeData(color: Colors.purple[600]),
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              selectedLabelTextStyle: TextStyle(color: Colors.purple[600]),
            ),
            child: NavigationRail(
              selectedIndex: currentIndex > 3 ? null : currentIndex,
              onDestinationSelected: (index) => _onItemTapped(context, index),
              labelType: NavigationRailLabelType.none,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.message_outlined),
                  label: Text('Contactos'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.donut_large_rounded),
                  label: Text('Estados'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.people_alt_outlined),
                  label: Text('Grupos'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.color_lens),
                  label: Text('Tema'),
                ),
              ],
              trailing: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: currentIndex == 4 ? Colors.purple[600] : Colors.grey,
                      ),
                      tooltip: 'Configuración',
                      onPressed: () => _onItemTapped(context, 4),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.person,
                        color: currentIndex == 5 ? Colors.purple[600] : Colors.grey,
                      ),
                      tooltip: 'Perfil',
                      onPressed: () => _onItemTapped(context, 5),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: child),
        ],
      ),
    );
  }
}
