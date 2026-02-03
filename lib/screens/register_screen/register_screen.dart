import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/providers/auth/auth_notifier.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final isAuthLoading = ref.watch(
      authNotifierProvider.select((state) => state.isLoading),
    );
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l10n.register, style: const TextStyle(fontSize: 24)),
              const SizedBox(height: 60),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  spacing: 16,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: l10n.email,
                        border: const OutlineInputBorder(),
                      ),
                      controller: _emailController,
                      style: const TextStyle(fontSize: 16),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: l10n.password,
                        border: const OutlineInputBorder(),
                      ),
                      obscureText: true,
                      controller: _passwordController,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isAuthLoading
                    ? null
                    : () async {
                        final success = await authNotifier.register(
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
