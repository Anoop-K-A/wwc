import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_wave_connect/authentication.dart';

class SignUpController {
  SignUpController();

  //Stream<User?> get authState => SignUpController.instance.idTokenChanges();
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

  void registerUser(String email, String password, BuildContext context) async {
    context
        .read<FirebaseAuthMethods>()
        .signUpWithEmail(email: email, password: password, context: context);
  }

  void loginUser(String email, String password, BuildContext context) async {
    context
        .read<FirebaseAuthMethods>()
        .logInWithEmail(email: email, password: password, context: context);
  }
}
