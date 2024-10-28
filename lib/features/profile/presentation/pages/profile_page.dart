import 'package:chat_application/features/authentication/services/authentication_service.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Profile page'),
          IconButton(
            onPressed: AuthenticationService().signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
