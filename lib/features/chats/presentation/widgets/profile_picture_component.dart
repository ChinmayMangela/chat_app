import 'package:flutter/material.dart';

class ProfilePictureComponent extends StatelessWidget {
  const ProfilePictureComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 25,
      backgroundImage: AssetImage(
        'assets/images/default_profile_picture.png',
      ),
    );
  }
}
