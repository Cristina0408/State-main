import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme/cubit/theme_cubit.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simula una carga de 2 segundos
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Cambiar Tema')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              iconSize: 80,
              icon: Icon(
                isDark ? Icons.wb_sunny_outlined : Icons.nightlight_round,
                color: isDark ? Colors.amber : const Color.fromARGB(255, 93, 171, 210),
              ),
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme();
              },
            ),
            const SizedBox(height: 10),
            Text(
              isDark ? 'Modo Claro' : 'Modo Oscuro',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
