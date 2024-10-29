import 'package:chat_application/features/authentication/domain/end_user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.user,
  });

  final EndUser user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(
            'assets/images/default_profile_picture.png',
          ),
        ),
        title: Text(user.name, style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis
        ),),
        subtitle: Text('Hello Mansi Patil i love you more than anyone else', style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Colors.grey,
          overflow: TextOverflow.ellipsis
        ),),
      ),
    );
  }
}
