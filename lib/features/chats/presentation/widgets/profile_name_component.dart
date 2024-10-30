import 'package:flutter/material.dart';

class ProfileNameComponent extends StatelessWidget {
  const ProfileNameComponent({
    super.key,
    required this.profileName,
  });

  final String profileName;

  @override
  Widget build(BuildContext context) {
    return Text(
      profileName,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
    );
  }
}
