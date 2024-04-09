// file: signin/view.dart
import 'package:flutter/material.dart';

import 'controller.dart';

class SigninView extends StatefulWidget {
  final SignInController controller;

  const SigninView({super.key, required this.controller});

  @override
  SigninViewState createState() => SigninViewState();
}

class SigninViewState extends State<SigninView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                obscureText: _obscurePassword,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  const Text('Remember me'),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      // Handle forget password
                    },
                    child: const Text('Forget Password?'),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: widget.controller.isLoading
                    ? null
                    : () {
                        if (_formKey.currentState?.validate() ?? false) {
                          widget.controller.login(
                            _emailController.text,
                            _passwordController.text,
                          );
                        }
                      },
                child: widget.controller.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Login'),
              ),
              if (widget.controller.errorMessage != null)
                Text(
                  widget.controller.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
