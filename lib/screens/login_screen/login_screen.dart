import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nim2book_mobile_flutter/core/bloc/auth/auth_cubit.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:talker_flutter/talker_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _logger = GetIt.I.get<Talker>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
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
                              final success = await googleLogin(idToken);

                              _logger.info(success);

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
                            _logger.error(e);
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
