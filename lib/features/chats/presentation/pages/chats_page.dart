import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Chats', style: Theme.of(context).textTheme.headlineLarge!.copyWith(
        color: Theme.of(context).colorScheme.primaryContainer,
        fontWeight: FontWeight.bold,
      ),),
    );
  }
}
