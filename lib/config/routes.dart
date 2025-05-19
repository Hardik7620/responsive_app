import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_app/providers/auth_provider.dart';
import 'package:responsive_app/screens/home_screen.dart';
import 'package:responsive_app/screens/login_screen.dart';

class AppRouter {
  static GoRouter getRouter(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return GoRouter(
      initialLocation: '/',
      redirect: (context, state) {
        final bool isLoggedIn = authProvider.isAuthenticated;
        final bool isGoingToLogin = state.matchedLocation == '/login';

        // If not logged in and not going to login, redirect to login
        if (!isLoggedIn && !isGoingToLogin) {
          return '/login';
        }

        // If logged in and going to login, redirect to home
        if (isLoggedIn && isGoingToLogin) {
          return '/home';
        }

        // No redirection needed
        return null;
      },
      refreshListenable: authProvider,
      routes: [
        GoRoute(
          path: '/',
          redirect: (_, __) => authProvider.isAuthenticated ? '/home' : '/login',
        ),
        GoRoute(
          path: '/login',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const LoginScreen(),
          ),
        ),
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const HomeScreen(),
          ),
        ),
      ],
    );
  }
}