import 'package:chat_application/features/authentication/presentation/pages/log_in_page.dart';
import 'package:chat_application/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class LoginAndSignup extends StatefulWidget {
  const LoginAndSignup({super.key});

  @override
  State<LoginAndSignup> createState() => _LoginAndSignupState();
}

class _LoginAndSignupState extends State<LoginAndSignup> {
  bool _logInPageDisplayed = true;

  void _toggleScreen() {
    setState(() {
      _logInPageDisplayed = !_logInPageDisplayed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _logInPageDisplayed
        ? LogInPage(
            onSignUpTap: _toggleScreen,
          )
        : SignUpPage(
            onLoginTap: _toggleScreen,
          );
  }
}
