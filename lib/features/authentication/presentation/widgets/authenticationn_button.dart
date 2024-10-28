import 'package:chat_application/common/utils/utils.dart';
import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Utils.getScreenWidth(context),
        height: Utils.getScreenHeight(context) * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
