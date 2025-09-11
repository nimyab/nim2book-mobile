import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/contexts/auth_context.dart';
import 'package:nim2book_mobile_flutter/features/user_profile/user_profile.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = context.select<AuthContext, bool>(
      (value) => value.isAuthenticated,
    );
    final isAuthLoading = context.select<AuthContext, bool>(
      (value) => value.isLoading,
    );

    return Scaffold(
      body: SafeArea(
        child: isAuthenticated
            ? const UserProfile()
            : Center(
                child: Column(
                  spacing: 20,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Please login or register',
                      style: TextStyle(fontSize: 16),
                    ),
                    ElevatedButton(
                      onPressed: isAuthLoading
                          ? null
                          : () => context.go('/login'),
                      child: isAuthLoading
                          ? const CircularProgressIndicator(padding: EdgeInsets.all(10),)
                          : const Text('Login'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
