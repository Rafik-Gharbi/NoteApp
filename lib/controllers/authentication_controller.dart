import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/shared_preferences_keys.dart';
import '../views/home_screen.dart';
import '../services/shared_preferences_service.dart';

class AuthenticationController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loginUser(BuildContext context) async {
    if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text,
        );
        if (userCredential.user?.email != null) {
          SharedPreferencesService().put(userKey, userCredential.user!.email!);
          Get.offAndToNamed(HomeScreen.routeName);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          debugPrint('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          debugPrint('Wrong password provided for that user.');
        }
      }
    }
  }
}
