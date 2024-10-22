import 'package:chat_app/features/authentication/services/authentication_service.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(onPressed: () {
          AuthenticationService().signOut();
        }, icon: Icon(Icons.logout)),
      ),
    );
  }
}
