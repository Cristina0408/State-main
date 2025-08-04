import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  
@override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      context.go('/contacts');
    });
  }
  @override
  void dispose() {
    _timer?.cancel(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 120, child: Image.asset('assets/images/logo.webp')),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  minHeight: 6,
                  backgroundColor: Colors.grey,
                  color: Colors.green[600],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: const Text(
                'Cargando...',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
