import 'package:chat_app/common/utils/utils.dart';
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
    final bool isDarkMode = Theme.of(context).colorScheme.brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Utils.getScreenWidth(context),
        height: Utils.getScreenHeight(context) * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: isDarkMode ?  Colors.white : Colors.black
            ),
          ),
        ),
      ),
    );
  }
}
