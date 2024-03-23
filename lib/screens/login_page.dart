import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal_chat_app/providers/auth_provider.dart';
import 'package:minimal_chat_app/screens/register_page.dart';
import 'package:minimal_chat_app/widgets/button.dart';
import 'package:minimal_chat_app/widgets/textfield.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<LoginPage> {
  //Navigate
  void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

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
              ),
              const SizedBox(height: 20),
              MyButton(
                text: "Login",
                onTap: () async {
                  authPro.login(context);
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member? ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      )),
                  GestureDetector(
                    onTap: () {
                      navigateToScreen(context, const RegisterPage());
                    },
                    child: Text(
                      "Register now",
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
