import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_colors.dart';
import '../../../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import '../../../../core/widgets/helpers.dart';
import '../../../../routes/routes.dart';

class AuthController extends GetxController with Helpers {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AppSettingsSharedPreferences _prefs = AppSettingsSharedPreferences();
  bool checkboxValue = false;


  var isLoading = false.obs;

  User? get user => _auth.currentUser;

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.offAllNamed(Routes.homeView);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Login Failed", e.message ?? "Unknown error");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      isLoading.value = true;

      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Directly navigate to login after successful signup
      Get.offAllNamed(Routes.loginView);

    } on FirebaseAuthException catch (e) {
      Get.snackbar("Signup Failed", e.message ?? "Unknown error");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      isLoading.value = true;
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar("Success", "Password reset email sent to $email");
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Reset Failed", e.message ?? "Unknown error");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {

    await _auth.signOut();
    Get.offAllNamed('/login');
  }
  changeValue() {
    checkboxValue = !checkboxValue;
    update();
  }
}
