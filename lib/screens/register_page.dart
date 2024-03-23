import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal_chat_app/providers/auth_provider.dart';
import 'package:minimal_chat_app/screens/login_page.dart';
import 'package:minimal_chat_app/utils.dart';
import 'package:minimal_chat_app/widgets/button.dart';
import 'package:minimal_chat_app/widgets/textfield.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final authPro = ref.watch(authProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 20),
              Text(
                "Welcome back , you've been missed!",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 20),
              KTextField(
                hintText: "Email",
                obscureText: false,
                controller: authPro.emailCtrl,
              ),
              const SizedBox(height: 20),
              KTextField(
                hintText: "Password",
                obscureText: true,
                controller: authPro.passCtrl,
                // controller: passCtrl,
              ),
              const SizedBox(height: 20),
              KTextField(
                hintText: "Confirm Password",
                obscureText: true,
                controller: authPro.confirmPassCtrl,
              ),
              const SizedBox(height: 20),
              MyButton(
                text: "Register",
                onTap: () async {
                  authPro.register(context);
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      )),
                  GestureDetector(
                    onTap: () {
                      navigateToScreen(context, const LoginPage());
                    },
                    child: Text(
                      "Login now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
