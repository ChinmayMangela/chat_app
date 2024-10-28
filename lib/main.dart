import 'package:chat_application/common/theme/app_theme.dart';
import 'package:chat_application/features/authentication/presentation/pages/auth_gate.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      theme: theme,
      darkTheme: theme,
      routes: {

      },
      home: const AuthGate(),
    );
  }
}
