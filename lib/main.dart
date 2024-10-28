import 'package:chat_application/common/theme/app_theme.dart';
import 'package:chat_application/features/authentication/presentation/pages/auth_gate.dart';
import 'package:chat_application/features/authentication/presentation/pages/forgot_password_page.dart';
import 'package:chat_application/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
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
        '/forgotPasswordPage': (context) => const ForgotPasswordPage(),
      },
      home: const AuthGate(),
    );
  }
}
