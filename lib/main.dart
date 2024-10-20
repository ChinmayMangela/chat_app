import 'package:chat_app/common/theme/app_theme.dart';
import 'package:chat_app/features/authentication/presentation/pages/log_in_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: messengerKey,
      navigatorKey: navigatorKey,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const LogInPage(),
    );
  }
}
