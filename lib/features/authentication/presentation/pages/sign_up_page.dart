import 'package:chat_application/common/utils/utils.dart';
import 'package:chat_application/common/widgets/custom_text_field.dart';
import 'package:chat_application/constants/string_constants.dart';
import 'package:chat_application/features/authentication/presentation/widgets/authenticationn_button.dart';
import 'package:chat_application/features/authentication/presentation/widgets/heading_component.dart';
import 'package:chat_application/features/authentication/presentation/widgets/sub_heading_component.dart';
import 'package:chat_application/main.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
    required this.onLoginTap,
  });

  final void Function() onLoginTap;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void onTogglePasswordState() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _signUp() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Utils.showSnackBar('Enter your credentials');
      return;
    }

    if (name.length < 5) {
      Utils.showSnackBar('Length of name must be greater than 5 characters');
      return;
    }

    Utils.showCircularProgressIndicator(context);


  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
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
              const HeadingComponent(headingText: signUpHeadingText),
              SizedBox(height: screenHeight * 0.02),
              const SubHeadingComponent(subHeading: signUpSubHeadingText),
              SizedBox(height: screenHeight * 0.05),
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
        _buildNameTextField(),
        SizedBox(height: screenHeight * 0.015),
        _buildEmailTextField(),
        SizedBox(height: screenHeight * 0.015),
        _buildPasswordField(),
        SizedBox(height: screenHeight * 0.025),
        _buildSignUpButton(),
        SizedBox(height: screenHeight * 0.02),
        _buildBottomMessage()
      ],
    );
  }

  Widget _buildNameTextField() {
    return CustomTextField(
      controller: _nameController,
      hintText: 'Name',
      isPasswordField: false,
      obscureText: false,
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

  Widget _buildSignUpButton() {
    return AuthenticationButton(
      label: 'Signup',
      onTap: _signUp,
    );
  }

  Widget _buildBottomMessage() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context).textTheme.labelLarge;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: theme!.copyWith(
            color: Colors.grey,
          ),
        ),
        TextButton(
          onPressed: widget.onLoginTap,
          child: Text(
            'Login here',
            style: theme.copyWith(
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
