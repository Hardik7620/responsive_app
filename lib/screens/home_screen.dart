import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_app/providers/auth_provider.dart';
import 'package:responsive_app/utils/constants.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Home Screen',
          style: AppTextStyles.titleDesktop.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () => authProvider.logout(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logoImage,
              height: 150,
              width: 165,
            ),
            const SizedBox(height: 40),
            Text(
              'Welcome to Home Screen',
              style: AppTextStyles.homeTitle,
            ),
            const SizedBox(height: 20),
            Text(
              'You have successfully logged in!',
              style: AppTextStyles.homeSubtitle,
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => authProvider.logout(),
              child: Text(
                'Log Out',
                style: AppTextStyles.buttonTextDesktop,
              ),
            ),
          ],
        ),
      ),
    );
  }
}