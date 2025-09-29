import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/web.dart';
import 'package:nim2book_mobile_flutter/core/contexts/auth_context.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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
  Widget build(BuildContext context) {
    final login = context.read<AuthContext>().login;
    final googleLogin = context.read<AuthContext>().googleLogin;
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
              Text(l10n.login, style: TextStyle(fontSize: 24)),
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

              SizedBox(height: 20),

              if (GoogleSignIn.instance.supportsAuthenticate())
                IconButton.filledTonal(
                  icon: FaIcon(FontAwesomeIcons.google),
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
