import 'package:chat_application/common/utils/utils.dart';
import 'package:flutter/material.dart';

class LockIcon extends StatelessWidget {
  const LockIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.lock_open,
      size: Utils.getScreenHeight(context) * 0.14,
    );
  }
}
