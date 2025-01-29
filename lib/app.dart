import 'package:flutter/material.dart';
import 'core/routing/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Flutter App',
      theme: ThemeData.light(),
      routerConfig: appRouter,
    );
  }
}
