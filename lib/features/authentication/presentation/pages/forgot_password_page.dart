import 'package:chat_application/common/utils/utils.dart';
import 'package:chat_application/common/widgets/custom_text_field.dart';
import 'package:chat_application/common/widgets/text_based_on_theme.dart';
import 'package:chat_application/constants/string_constants.dart';
import 'package:chat_application/features/authentication/presentation/widgets/authenticationn_button.dart';
import 'package:chat_application/features/authentication/services/authentication_service.dart';
import 'package:chat_application/main.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  final AuthenticationService _authenticationService = AuthenticationService();

  Future<void> _forgotPassword() async {
    if (_emailController.text.trim().isEmpty) {
      Utils.showSnackBar('Enter your email');
      return;
    }
    await _authenticationService.forgotPassword(email: _emailController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    final bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
    return AppBar(
      leading: IconButton(
          onPressed: () {
            navigatorKey.currentState!.pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: isDarkMode ? Colors.white : Colors.black,
          )),
      title: TextBasedOnTheme(
        text: 'Forgot Password',
        textTheme: Theme.of(context).textTheme.titleLarge!,
      ),
    );
  }

  Widget _buildBody() {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              forgotPasswordPageMessage,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: isDarkTheme ? Colors.white : Colors.black),
            ),
            SizedBox(height: Utils.getScreenHeight(context) * 0.019),
            _buildEmailField(),
            SizedBox(height: Utils.getScreenHeight(context) * 0.015),
            AuthenticationButton(
              label: 'Reset Password',
              onTap: _forgotPassword,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      controller: _emailController,
      hintText: 'Email',
      isPasswordField: false,
      obscureText: false,
    );
  }
}
