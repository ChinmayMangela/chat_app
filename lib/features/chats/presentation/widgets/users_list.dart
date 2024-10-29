import 'package:chat_application/features/authentication/domain/end_user.dart';
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
        return Text(users[index].email);
      },
      itemCount: users.length,
    );
  }
}
