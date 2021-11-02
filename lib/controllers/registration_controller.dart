import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  //variables para capturar informacion de usuario
  final nameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final vPasswordController = TextEditingController();

  late bool success;
  late String userEmail;

  @override
  void dispose() {
    nameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    vPasswordController.dispose();
    super.dispose();
  }

  void register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text))
        .user;
    if (user != null) {
      success = true;
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Get.toNamed("/login");
        },
      );
      userEmail = user.email!;
    } else {
      success = false;
    }
  }
}
