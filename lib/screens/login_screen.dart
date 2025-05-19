import 'package:flutter/material.dart';
import 'package:responsive_app/screens/login_form.dart';
import 'package:responsive_app/screens/login_image_section.dart';
import 'package:responsive_app/utils/constants.dart';
import 'package:responsive_app/widgets/responsive_widget.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ResponsiveLayout(
        mobile: const _LoginMobile(),
        desktop: const _LoginDesktop(),
      ),
    );
  }
}

class _LoginDesktop extends StatelessWidget {
  const _LoginDesktop();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: LoginImageSection()),
        Expanded(
          child: Center(
            child: SizedBox(width: 400, child: LoginForm()),
          ),
        ),
      ],
    );
  }
}

class _LoginMobile extends StatelessWidget {
  const _LoginMobile();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: 400,
          child: LoginForm(),
        ),
      ),
    );
  }
}