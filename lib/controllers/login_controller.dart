import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  

  //variables para capturar informacion de usuario
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //autenticacion con Email y Password
  void signInWithEmailAndPassword() async {
    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;
      Get.snackbar('Hola', 'Su ingreso ha sido exitoso');
      print('Ingreso bien');
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Get.toNamed("/home");
        },
      );
    } catch (e) {
      Get.snackbar('Fallo', 'No puede ingresar',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //example sign out
  void _signOut() async {
    await _auth.signOut();
  }

  void signOut() async {
    final User? user = await _auth.currentUser;
    // ignore: unnecessary_null_comparison
    if (user == null) {
      Get.snackbar('Fuera', 'No se ha iniciado sesión.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    _signOut();
    final String uid = user.uid;
    Get.snackbar('Fuera', 'has salído correctamente.',
        snackPosition: SnackPosition.BOTTOM);
    Get.toNamed("/home");
  }

  //autenticacion por Google
  /*void signInWithGoogle() async {
    try {
      UserCredential userCredential;

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final OAuthCredential googleAuthCredential =
          GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      userCredential = await _auth.signInWithCredential(googleAuthCredential);

      final user = userCredential.user;
      Get.snackbar('Hola', 'Inicia sesión con Google');
      print('Ingresó bien');
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Get.toNamed("/NextPage");
        },
      );
    } catch (e) {
      print(e);
      Get.snackbar('Falló', 'No se pudo iniciar sesión con Google: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }*/
}
