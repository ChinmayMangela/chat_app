import 'package:chat_application/features/chats/domain/message.dart';
import 'package:chat_application/features/chats/presentation/widgets/message_tile.dart';
import 'package:flutter/material.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({
    super.key,
    required this.messages,
  });

  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final currentMessage = messages[index];
        return MessageTile(message: currentMessage);
      },
      itemCount: messages.length,
    );
  }
}
