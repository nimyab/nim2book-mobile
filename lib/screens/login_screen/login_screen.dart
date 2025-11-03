import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/web.dart';
import 'package:nim2book_mobile_flutter/core/bloc/auth/auth_cubit.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _logger = Logger();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final login = context.read<AuthCubit>().login;
    final googleLogin = context.read<AuthCubit>().googleLogin;
    final isAuthLoading = context.select(
      (final AuthCubit c) => c.state.isLoading,
    );
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l10n.login, style: const TextStyle(fontSize: 24)),
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
                        final success = await login(
                          _emailController.text,
                          _passwordController.text,
                        );

                        _logger.i(success);

                        if (context.mounted) {
                          if (!success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(l10n.loginFailed)),
                            );
                            return;
                          }
                          context.go('/settings');
                        }
                      },
                child: isAuthLoading
                    ? const CircularProgressIndicator(
                        padding: EdgeInsets.all(10),
                      )
                    : Text(l10n.loginButton),
              ),

              TextButton(
                onPressed: isAuthLoading
                    ? null
                    : () {
                        if (context.mounted) {
                          context.go('/register');
                        }
                      },
                child: Text(l10n.noAccountRegisterHere),
              ),

              const SizedBox(height: 20),

              if (GoogleSignIn.instance.supportsAuthenticate())
                IconButton.filledTonal(
                  icon: const FaIcon(FontAwesomeIcons.google),
                  onPressed: isAuthLoading
                      ? null
                      : () async {
                          try {
                            final account = await GoogleSignIn.instance
                                .authenticate();
                            final idToken = account.authentication.idToken;

                            if (idToken != null) {
                              final success = await googleLogin(idToken);

                              _logger.i(success);

                              if (context.mounted) {
                                if (!success) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(l10n.loginFailed)),
                                  );
                                  return;
                                }
                                context.go('/settings');
                              }
                            }
                          } catch (e) {
                            _logger.e(e);
                          }
                        },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
