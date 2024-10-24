import 'package:chat_app/common/theme/app_theme.dart';
import 'package:chat_app/features/authentication/presentation/pages/auth_gate.dart';
import 'package:chat_app/features/authentication/presentation/pages/forgot_password_page.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
      routes: {
        '/forgotPasswordPage': (context) => const ForgotPasswordPage(),
      },
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const AuthGate(),
    );
  }
}
