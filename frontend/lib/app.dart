import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/chat/chat_screen.dart';
import 'features/calendar/day_view.dart';

class AIPlannerApp extends StatelessWidget {
  const AIPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, __) => const ChatScreen()),
        GoRoute(path: '/calendar', builder: (_, __) => const DayView()),
      ],
    );

    return MaterialApp.router(
      title: 'AI Planner',
      theme: ThemeData(useMaterial3: true),
      routerConfig: router,
    );
  }
}
