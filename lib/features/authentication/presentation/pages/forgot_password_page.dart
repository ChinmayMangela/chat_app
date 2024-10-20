import 'package:chat_app/common/utils/utils.dart';
import 'package:chat_app/common/widgets/custom_text_field.dart';
import 'package:chat_app/common/widgets/text_based_on_theme.dart';
import 'package:chat_app/constants/string_constants.dart';
import 'package:chat_app/features/authentication/presentation/widgets/authenticationn_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

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
    return AppBar(
      title: const TextBasedOnTheme(text: 'Forgot Password'),
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
            Text(forgotPasswordPageMessage, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: isDarkTheme ? Colors.white : Colors.black
            ),),
            SizedBox(height: Utils.getScreenHeight(context) * 0.019),
            _buildEmailField(),
            SizedBox(height: Utils.getScreenHeight(context) * 0.015),
            AuthenticationButton(label: 'Reset Password', onTap: () {})
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
