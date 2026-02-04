import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nim2book_mobile_flutter/core/providers/auth/auth_provider.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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
    final isAuthLoading = ref.watch(isAuthLoadingProvider);
    final talker = ref.read(talkerProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l10n.login, style: const TextStyle(fontSize: 24)),

              const SizedBox(height: 20),

              if (GoogleSignIn.instance.supportsAuthenticate())
                ElevatedButton(
                  onPressed: isAuthLoading
                      ? null
                      : () async {
                          try {
                            final account = await GoogleSignIn.instance
                                .authenticate();
                            final idToken = account.authentication.idToken;

                            if (idToken != null) {
                              final success = await authNotifier.googleLogin(
                                idToken,
                              );

                              talker.info(success);

                              if (context.mounted) {
                                if (!success) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(l10n.loginFailed)),
                                  );
                                  return;
                                }
                                context.go('/my-books');
                              }
                            }
                          } catch (e) {
                            talker.error(e);
                          }
                        },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      const Icon(FontAwesomeIcons.google),
                      Text(l10n.loginWithGoogle),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
