import 'package:chat_application/common/utils/utils.dart';
import 'package:chat_application/features/chats/domain/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    const circularRadius = Radius.circular(14);
    final currentUser = FirebaseAuth.instance.currentUser;
    final isSenderMessage = message.senderId == currentUser?.uid;
    final textTheme = Theme.of(context).textTheme;
    final messageColor = isSenderMessage ? Colors.white : Colors.black;

    return Align(
      alignment: isSenderMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 1.5),
        padding: const EdgeInsets.all(10),
        constraints: BoxConstraints(
          maxWidth: Utils.getScreenWidth(context) * 0.7,
        ),
        decoration: BoxDecoration(
          color: isSenderMessage ? const Color(0xFF232323) : const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.only(
            topLeft: isSenderMessage ? circularRadius : Radius.zero,
            topRight: circularRadius,
            bottomLeft: circularRadius,
            bottomRight: isSenderMessage ? Radius.zero : circularRadius,
          ),
        ),
        child: Column(
          crossAxisAlignment: isSenderMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message.content,
              style: textTheme.bodyMedium!.copyWith(
                color: messageColor,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              Utils.getFormattedTime(message.timeStamp),
              style: TextStyle(
                color: messageColor,
                fontSize: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
