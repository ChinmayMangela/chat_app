import 'package:chat_application/features/authentication/services/user_service.dart';
import 'package:chat_application/features/chats/presentation/widgets/users_list.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Chats', style: Theme
          .of(context)
          .textTheme
          .headlineLarge!
          .copyWith(
        color: Theme
            .of(context)
            .colorScheme
            .primaryContainer,
        fontWeight: FontWeight.bold,
      ),),
    );
  }

  Widget _buildBody() {
    return StreamBuilder(
      stream: _userService.fetchUsers(), builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return _buildCircularProgressIndicator();
      }

      if(snapshot.data!.isEmpty) {
        return _buildMessage('No one has signed in');
      }

      if(snapshot.hasError) {
        return _buildMessage(snapshot.error.toString());
      } else {
        final users = snapshot.data;
        return UsersList(users: users!);
      }
    },);
  }

  Widget _buildCircularProgressIndicator() {
    return const Center(child: CircularProgressIndicator(),);
  }

  Widget _buildMessage(String message) {
    return Center(
      child: Text(message),
    );
  }
}
