import 'package:chat_app/features/authentication/domain/end_user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.endUser});

  final EndUser endUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: _buildProfileImage(),
        title: Text(
          endUser.name,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer,
                overflow: TextOverflow.ellipsis,
              ),
        ),
        subtitle: Text(
          'Hello Mansi, I want you to know that I love you more than anyone else. I am not sure how to express it fully, but it’s true. I’m ready to wait for you and support you in your studies because I don’t want to interrupt your progress. Once I become successful, my next step will be to marry you.',
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return const CircleAvatar(
      backgroundImage: AssetImage('assets/images/dummy_profile_pic.png'),
    );
  }
}
