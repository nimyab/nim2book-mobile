import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/contexts/auth_context.dart';
import 'package:nim2book_mobile_flutter/core/models/user/user.dart';
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

    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text('Email: ${user?.email ?? 'Unknown'}'),
          const SizedBox(height: 20),
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
