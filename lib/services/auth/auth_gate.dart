//auth gate having stream builder and its gonna listen continously if any auth state changes

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat_app/screens/homepage.dart';
import 'package:minimal_chat_app/screens/login_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //if user logged in
        if (snapshot.hasData) {
          return  HomePage();
        }
        //user is not logged in
        else {
          return const LoginPage();
        }
      },
    );
  }
}
