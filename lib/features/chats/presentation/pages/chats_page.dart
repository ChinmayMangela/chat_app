import 'package:chat_app/features/authentication/services/user_service.dart';
import 'package:chat_app/features/chats/presentation/widgets/users_list.dart';
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
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Chats',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
      ),
    );
  }

  Widget _buildBody() {
    return StreamBuilder(
      stream: UserService().fetchUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildCircularProgressIndicator(context);
        }

        if (snapshot.data!.isEmpty) {
          return _buildMessage('No one has signed in');
        }

        if (snapshot.hasData) {
          final users = snapshot.data;
          return UsersList(users: users!);
        } else {
          return _buildMessage(snapshot.error.toString());
        }
      },
    );
  }

  Widget _buildCircularProgressIndicator(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
    );
  }

  Widget _buildMessage(String message) {
    return Center(
      child: Text(message),
    );
  }
}
