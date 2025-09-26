import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/contexts/auth_context.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final register = context.read<AuthContext>().register;
    final isAuthLoading = context.select<AuthContext, bool>(
      (value) => value.isLoading,
    );
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l10n.register, style: TextStyle(fontSize: 24)),
              SizedBox(height: 60),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  spacing: 16,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: l10n.email,
                        border: OutlineInputBorder(),
                      ),
                      controller: _emailController,
                      style: TextStyle(fontSize: 16),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: l10n.password,
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      controller: _passwordController,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: isAuthLoading
                    ? null
                    : () async {
                        final success = await register(
                          _emailController.text,
                          _passwordController.text,
                        );

                        if (context.mounted) {
                          if (!success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(l10n.registrationFailed)),
                            );
                            return;
                          }
                          context.go('/login');
                        }
                      },
                child: isAuthLoading
                    ? const CircularProgressIndicator()
                    : Text(l10n.registerButton),
              ),
              TextButton(
                onPressed: isAuthLoading
                    ? null
                    : () {
                        if (context.mounted) {
                          context.go('/login');
                        }
                      },
                child: Text(l10n.alreadyHaveAccountLoginHere),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
