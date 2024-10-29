import 'package:chat_application/features/authentication/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(email.toString()),
          IconButton(
            onPressed: AuthenticationService().signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
