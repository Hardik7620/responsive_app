import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_app/providers/auth_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:responsive_app/utils/constants.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final success = await authProvider.login(
        _emailController.text.trim(),
        _passwordController.text,
      );

      if (!success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.error ?? 'Login failed'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthProvider>(context);

    return width < 800
        ? Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: _buildForm(width, authProvider),
    )
        : _buildForm(width, authProvider);
  }

  Widget _buildForm(double width, AuthProvider authProvider) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: width < 800 ? 78 : 120),
            Image.asset(AppImages.logoImage,
                height: width < 800 ? 106 : 150,
                width: width < 800 ? 115 : 165),
            SizedBox(height: width < 800 ? 68 : 80),
            Text(
              "Welcome, Login below",
              style: width < 800 ? AppTextStyles.titleMobile : AppTextStyles.titleDesktop,
            ),
            SizedBox(height: width < 800 ? 20 : 24),
            _buildInputField(
              controller: _emailController,
              hint: "Email address",
              validator: _validateEmail,
              width: width,
            ),
            SizedBox(height: width < 800 ? 16 : 20),
            _buildPasswordField(width),
            SizedBox(height: width < 800 ? 20 : 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(
                    vertical: width < 800 ? 10 : 11,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: authProvider.isLoading ? null : _login,
                child: authProvider.isLoading
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
                    : Text(
                  "Login",
                  style: width < 800
                      ? AppTextStyles.buttonTextMobile
                      : AppTextStyles.buttonTextDesktop,
                ),
              ),
            ),
            SizedBox(height: width < 800 ? 12 : 16),
            InkWell(
              onTap: () {
                if (kDebugMode) {
                  print('Forgot password tapped');
                }
              },
              child: Text(
                "Forgot Password?",
                style: width < 800
                    ? AppTextStyles.labelMobile
                    : AppTextStyles.labelDesktop,
              ),
            ),
            SizedBox(height: width < 800 ? 120 : 81),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: width < 800
                      ? AppTextStyles.subtitleMobile
                      : AppTextStyles.subtitleDesktop,
                ),
                InkWell(
                  onTap: () {
                    print('Create account tapped');
                    // Add navigation to create account page here
                  },
                  child: Text(
                    "Create Account",
                    style: width < 800
                        ? AppTextStyles.labelMobile
                        : AppTextStyles.labelDesktop
                  ),
                ),
              ],
            ),

            SizedBox(height: width < 800 ? 30 : 40),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
    required String? Function(String?) validator,
    required double width,
  }) {
    return TextFormField(cursorColor: AppColors.textPrimary,
      controller: controller,
      validator: validator,
      style: width < 800
          ? AppTextStyles.inputTextMobile
          : AppTextStyles.inputTextDesktop,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: width < 800
            ? AppTextStyles.inputHintMobile
            : AppTextStyles.inputHintDesktop,
        filled: true,
        fillColor: AppColors.inputBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error),
        ),
      ),
    );
  }

  Widget _buildPasswordField(double width) {
    return TextFormField(cursorColor: AppColors.textPrimary,
      controller: _passwordController,
      validator: _validatePassword,
      obscureText: !_passwordVisible,
      style: width < 800
          ? AppTextStyles.inputTextMobile
          : AppTextStyles.inputTextDesktop,
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: width < 800
            ? AppTextStyles.inputHintMobile
            : AppTextStyles.inputHintDesktop,
        filled: true,
        fillColor: AppColors.inputBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility_off : Icons.visibility,
            color: Colors.white54,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }
}