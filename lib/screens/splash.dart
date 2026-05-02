import 'package:flutter/material.dart';
import 'package:facdet/constants/color_constants.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go('/form');
      }
    });
  }

@override
Widget build(BuildContext context) {

  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        color: AppColors.accent,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.white,
                    AppColors.primary,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.glow.withOpacity(0.4),
                    blurRadius: 25,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: const Icon(
                Icons.face_retouching_natural,
                size: 70,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "AuraFace",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Reveal your natural tone ✨",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: 40),

            const CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.glow,
            ),

          ],
        ),
      ),
    ),);
}}



