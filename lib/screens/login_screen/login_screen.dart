import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';
import 'package:nim2book_mobile_flutter/core/contexts/auth_context.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final login = context.read<AuthContext>().login;
    final isAuthLoading = context.select<AuthContext, bool>(
      (value) => value.isLoading,
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login', style: TextStyle(fontSize: 24)),
              SizedBox(height: 60),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  spacing: 16,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      controller: _emailController,
                      style: TextStyle(fontSize: 16),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
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

                        Logger().i(success);

                        if (context.mounted) {
                          if (!success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login failed')),
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
                    : const Text('LOGIN'),
              ),

              TextButton(
                onPressed: isAuthLoading
                    ? null
                    : () {
                        if (context.mounted) {
                          context.go('/register');
                        }
                      },
                child: const Text('No account? Register here'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
