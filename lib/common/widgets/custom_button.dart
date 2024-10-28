import 'package:chat_application/common/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.child});

  final void Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Utils.getScreenHeight(context) * 0.08,
        width: Utils.getScreenWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}