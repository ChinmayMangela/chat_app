import 'package:flutter/material.dart';

class MessageSenderButton extends StatelessWidget {
  const MessageSenderButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          Icons.send,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
