import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/contact.dart';
import '../../features/theme_page/theme_page.dart';
import '../pages/group/create_group_page.dart';
import '../pages/group/groups_page.dart';
import '../pages/chat/chat_contact/chat_contact_page.dart';
import '../pages/chat/chat_group/chat_group_page.dart';
import '../pages/chat/chat_profile/chat_profile_page.dart';
import '../pages/contacts/contacts_page.dart';
import '../pages/profile/profile_edit_page/profile_edit_page.dart';
import '../pages/profile/profile_page/profile_page.dart';
import '../pages/splash/splash_screen.dart';
import '../pages/states/states_page.dart';
import '../widgets/bottom_navigation_bar.dart';


GoRouter createRouter(BuildContext context) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return NavigationBar(
            currentLocation: state.uri.toString(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/contacts',
            name: 'contacts',
            builder: (context, state) => const ContactsPage(),
          ),
          GoRoute(
            path: '/states',
            name: 'states',
            builder: (context, state) => const StatesPage(),
          ),
          GoRoute(
            path: '/groups', 
            name: 'groups',
            builder: (context, state) => const GroupsPage(),
          ),
          GoRoute(
            path: '/theme',
            name: 'theme',
            builder: (context, state) => const ThemePage(),
          ),
        ],
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfilePage("1", professionId: 'p1'),
      ),
      GoRoute(
        path: '/profile/edit',
        name: 'profile_edit',
        builder: (context, state) => ProfileEditPage(),
      ),
      GoRoute(
        path: '/chat/:id',
        builder: (context, state) {
          final contactId = state.pathParameters['id']!;
          return ChatContactPage(contactId: contactId);
        },
      ),
      GoRoute(
        path: '/create-group',
        name: 'create-group',
        builder: (context, state) => const CreateGroupPage(),
      ),
      GoRoute(
        path: '/chat-group/:id',
        builder: (context, state) {
          final groupId = state.pathParameters['id']!;
          return ChatGroupPage(groupId: groupId);
        },
      ),
      GoRoute(
        path: '/profile/contact/:id',
        name: 'profile_contact',
        builder: (context, state) {
          final contact = state.extra as Contact;
          return ContactProfilePage(contact: contact);
        },
      ),
    ],
  );
}
