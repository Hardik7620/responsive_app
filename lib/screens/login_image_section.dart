import 'package:flutter/material.dart';
import 'package:responsive_app/utils/constants.dart';


class LoginImageSection extends StatelessWidget {
  const LoginImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Center(
        child: Image.asset(
          AppImages.antennaImage,
          fit: BoxFit.cover,
          height: 480,
          width: 480,
        ),
      ),
    );
  }
}