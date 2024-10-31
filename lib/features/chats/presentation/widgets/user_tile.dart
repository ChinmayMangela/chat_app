import 'package:chat_application/features/authentication/domain/end_user.dart';
import 'package:chat_application/features/chats/presentation/widgets/profile_name_component.dart';
import 'package:chat_application/features/chats/presentation/widgets/profile_picture_component.dart';
import 'package:chat_application/features/chats/services/chats_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        leading: const ProfilePictureComponent(),
        title: ProfileNameComponent(
          profileName: user.name,
        ),
        subtitle: _buildMessageAsSubTitle(),
      ),
    );
  }

  Widget _buildMessageAsSubTitle() {
    final senderId = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(stream: ChatsService().fetchLastMessage(senderId, user.id), builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator()); // Loading state
      }

      final lastMessage = snapshot.data;

      if (lastMessage != null) {
        return Text(lastMessage.content, style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Colors.grey,
            overflow: TextOverflow.ellipsis
        ),);
      } else {
        return const Text('');
      }
    });
  }
}
