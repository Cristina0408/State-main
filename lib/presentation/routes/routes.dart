import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../application/profession_cubit/profession_cubit.dart';
import '../../features/theme_page/theme_page.dart';
import '../pages/professions/profession_page.dart';
import '../pages/profile/profile_edit_page/profile_edit_page.dart';
import '../pages/profile/profile_page/profile_page.dart';

GoRouter createRouter(BuildContext context) {
  return GoRouter(
    initialLocation: '/profile',
    redirect: (BuildContext context, GoRouterState state) {
      return null;
    },
    routes: [
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => ProfilePage("1", professionId: 'p1'),
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
        path: '/theme',
        name: 'theme',
        builder: (context, state) => ThemePage(),
      ),
    ],
  );
}
