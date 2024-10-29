import 'package:chat_application/features/authentication/domain/end_user.dart';
import 'package:chat_application/features/chats/presentation/widgets/user_tile.dart';
import 'package:flutter/material.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    super.key,
    required this.users,
  });

  final List<EndUser> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final currentUser = users[index];
        return UserTile(user: currentUser);
      },
      itemCount: users.length,
    );
  }
}
