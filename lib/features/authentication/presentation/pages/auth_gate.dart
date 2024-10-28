import 'package:chat_application/features/authentication/presentation/pages/login_and_signup.dart';
import 'package:chat_application/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if(snapshot.hasData) {
        return const Home();
      } else {
        return const LoginAndSignup();
      }
    });
  }
}
