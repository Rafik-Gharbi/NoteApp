import 'package:flutter/material.dart';

import '../controllers/authentication_controller.dart';

class LoginScreen extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => const LoginScreen());
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authenticationService = AuthenticationController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Please sign in', style: TextStyle(fontSize: 35.0)),
              const SizedBox(height: 20),
              TextField(
                controller: authenticationService.usernameController,
                decoration: const InputDecoration(hintText: 'Type your email here'),
              ),
              TextField(
                controller: authenticationService.passwordController,
                decoration: const InputDecoration(hintText: 'Type your password'),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                child: const Text('Sign in'),
                onPressed: () => authenticationService.loginUser(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
