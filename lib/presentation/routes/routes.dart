import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../application/profession_cubit/profession_cubit.dart';
import '../../features/theme_page/theme_page.dart';
import '../pages/chat/chat_page.dart';
import '../pages/contacts/contacts_page.dart';
import '../pages/profile/professions/profession_page.dart';
import '../pages/profile/profile_edit_page/profile_edit_page.dart';
import '../pages/profile/profile_page/profile_page.dart';
import '../pages/splash/splash_screen.dart';
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
          return NavigationBar(child: child);
        },
        routes: [
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfilePage("1", professionId: 'p1'),
          ),
          GoRoute(
            path: '/contacts',
            name: 'contacts',
            builder: (context, state) => const ContactsPage(),
          ),
          GoRoute(
            path: '/theme',
            name: 'theme',
            builder: (context, state) => const ThemePage(),
          ),
        ],
      ),
      GoRoute(
        path: '/profile/edit',
        name: 'profile_edit',
        builder: (context, state) => ProfileEditPage(),
      ),
      GoRoute(
        path: '/profession/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;

          return BlocProvider(
            create: (_) => ProfessionCubit()..loadUser(id),
            child: const ProfessionPage(),
          );
        },
      ),
      GoRoute(
      path: '/chat/:id',
      builder: (context, state) {
        final contactId = state.pathParameters['id']!;
        return ChatPage(contactId: contactId);
      },
      ),
    ],
  );
}
