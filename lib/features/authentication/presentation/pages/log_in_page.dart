import 'package:chat_application/common/utils/utils.dart';
import 'package:chat_application/common/widgets/custom_text_field.dart';
import 'package:chat_application/constants/string_constants.dart';
import 'package:chat_application/features/authentication/presentation/widgets/authenticationn_button.dart';
import 'package:chat_application/features/authentication/presentation/widgets/heading_component.dart';
import 'package:chat_application/features/authentication/presentation/widgets/sub_heading_component.dart';
import 'package:chat_application/main.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({
    super.key,
    required this.onSignUpTap,
  });

  final void Function() onSignUpTap;

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;


  void onTogglePasswordState() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _logIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Utils.showSnackBar('Enter your credentials');
      return;
    }

    Utils.showCircularProgressIndicator(context);

  }

  void _onForgotPasswordTapped() {

  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final screenHeight = Utils.getScreenHeight(context);
    return Padding(
      padding: EdgeInsets.all(screenHeight * 0.018),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeadingComponent(headingText: logInHeadingText),
              SizedBox(height: screenHeight * 0.02),
              const SubHeadingComponent(subHeading: logInSubHeadingText),
              SizedBox(height: screenHeight * 0.06),
              _buildLogInForm(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildLogInForm() {
    final screenHeight = Utils.getScreenHeight(context);
    return Column(
      children: [
        _buildEmailTextField(),
        SizedBox(height: screenHeight * 0.015),
        _buildPasswordField(),
        SizedBox(height: screenHeight * 0.005),
        _buildForgotPasswordButton(),
        SizedBox(height: screenHeight * 0.015),
        _buildLogInButton(),
        SizedBox(height: screenHeight * 0.02),
        _buildBottomMessage()
      ],
    );
  }

  Widget _buildEmailTextField() {
    return CustomTextField(
      controller: _emailController,
      hintText: 'Email',
      isPasswordField: false,
      obscureText: false,
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      controller: _passwordController,
      hintText: 'password',
      isPasswordField: true,
      obscureText: _obscurePassword,
      onTogglePasswordState: onTogglePasswordState,
    );
  }

  Widget _buildForgotPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: _onForgotPasswordTapped,
          child: const Text('Forgot Password',
              style: TextStyle(
                color: Colors.grey,
              )),
        ),
      ],
    );
  }

  Widget _buildLogInButton() {
    return AuthenticationButton(
      label: 'Login',
      onTap: _logIn,
    );
  }

  Widget _buildBottomMessage() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context).textTheme.labelLarge;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: theme!.copyWith(
            color: Colors.grey,
          ),
        ),
        TextButton(
          onPressed: widget.onSignUpTap,
          child: Text(
            'Register here',
            style: theme.copyWith(
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
