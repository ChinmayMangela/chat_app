import 'dart:async';
import 'package:chat_application/common/widgets/custom_button.dart';
import 'package:chat_application/features/authentication/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../home.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  bool isEmailVerified = false;
  final AuthenticationService _authenticationService = AuthenticationService();
  Timer? timer;

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if(!isEmailVerified) {
      _sendEmailVerification();
      timer = Timer.periodic(const Duration(seconds: 3), (_) {
        return _checkEmailVerified();
      });
    }
  }

  void _sendEmailVerification() async {
    await _authenticationService.sendEmailVerification();
  }

  void _checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if(isEmailVerified) {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
    return isEmailVerified
        ? const Home()
        : Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'A verification email has been sent to your account',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              _buildResendButton(),
              const SizedBox(height: 10),
              _buildCancelButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResendButton() {
    final bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
    return CustomButton(
      onTap: _sendEmailVerification,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.email,
            color: isDarkMode ? Colors.black : Colors.white,
          ),
          const SizedBox(width: 10),
          Text(
            'Resend Email',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: isDarkMode ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCancelButton() {
    final bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
    return CustomButton(
      onTap: () async {
        await _authenticationService.signOut();
      },
      child: Text('Cancel' ,style: Theme.of(context).textTheme.labelMedium!.copyWith(
        color: isDarkMode ? Colors.black : Colors.white,
      ),),
    );
  }
}