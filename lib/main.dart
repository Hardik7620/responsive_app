import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_app/config/routes.dart';
import 'package:responsive_app/providers/auth_provider.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_app/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the AuthProvider first to check for existing tokens
  final authProvider = AuthProvider();
  await authProvider.initAuthState();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Responsive App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        textTheme: GoogleFonts.outfitTextTheme(Theme.of(context).textTheme),
      ),
      routerConfig: AppRouter.getRouter(context),
    );
  }
}