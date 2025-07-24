import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7), () {
      context.go('/contacts'); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  minHeight: 44, 
                  backgroundColor: Colors.grey,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Cargando...',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
