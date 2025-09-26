import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/contexts/auth_context.dart';
import 'package:nim2book_mobile_flutter/core/models/user/user.dart';
import 'package:nim2book_mobile_flutter/widgets/theme_switcher.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select<AuthContext, User?>((value) => value.user);
    final isAuthLoading = context.select<AuthContext, bool>(
      (value) => value.isLoading,
    );
    final logout = context.read<AuthContext>().logout;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 16,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 16,
                children: [
                  Text(
                    'Profile',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Email: ${user?.email ?? 'Unknown'}'),
                ],
              ),
            ),
          ),
          const ThemeSwitcher(),
          ElevatedButton(
            onPressed: isAuthLoading
                ? null
                : () async {
                    final success = await logout();
                    if (!success && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Logout failed')),
                      );
                    }
                  },
            child: isAuthLoading
                ? const CircularProgressIndicator(padding: EdgeInsets.all(10))
                : const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
