
import 'package:facdet/screens/splash.dart';
import 'package:facdet/router/app_router.dart';
import 'package:flutter/material.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
