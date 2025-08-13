import 'package:estado/application/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart';
import 'application/theme_cubit/theme_cubit.dart';

import 'application/chat_cubit/chat_cubit.dart';
import 'application/group_cubit/group_cubit.dart';
import 'application/search_cubit/search_panel_cubit.dart';
import 'presentation/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final router = createRouter(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(
          create: (_) => ProfileCubit()..loadUser("3"),
        ),
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => ChatCubit()),
        BlocProvider<GroupCubit>(create: (_) => GroupCubit()),
        BlocProvider(create: (_) => SearchPanelCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
