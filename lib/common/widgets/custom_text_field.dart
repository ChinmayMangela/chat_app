import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isPasswordField,
    required this.obscureText,
    this.onTogglePasswordState,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isPasswordField;
  final bool obscureText;
  final void Function()? onTogglePasswordState;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 0.1,
        color: Colors.white,
      ),
    );
    return TextField(
      obscureText: obscureText,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: Colors.black),
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: isPasswordField
              ? IconButton(
                  onPressed: onTogglePasswordState,
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                )
              : null,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          hintText: hintText,
          border: border,
          focusedBorder: border,
          enabledBorder: border,
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true),
    );
  }
}
