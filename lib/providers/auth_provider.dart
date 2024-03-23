import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';

final authProvider = ChangeNotifierProvider((ref) => AuthProvider());

class AuthProvider extends ChangeNotifier {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final TextEditingController confirmPassCtrl = TextEditingController();

  
  //login method
  void login(BuildContext context) {
    //auth instace
    AuthService auth = AuthService();
    try {
      //signIn
      auth.signInWithEmailPassword(emailCtrl.text, passCtrl.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  //register
  void register(BuildContext context) {
    //get auth service
    final auth = AuthService();
    // password match -> create user
    if (passCtrl.text == confirmPassCtrl.text) {
      try {
        auth.signUpWithEmailPassword(emailCtrl.text, passCtrl.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
      }
    }
    //password doesn't match -> show error
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text(
            "Pasword Mismatch",
          ),
        ),
      );
    }
  }

  void signOut() {
    //create auth instance
    final auth = AuthService();
    auth.signOut();
    //clear the controllers
    emailCtrl.clear();
    passCtrl.clear();
    confirmPassCtrl.clear();
  }
}
