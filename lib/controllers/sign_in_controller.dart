// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home/repository/auth_repository.dart';

class SignInController extends GetxController {
  final _authRepository = Get.find<AuthRepository>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final error = Rx<String?>(null); //si existe error
  final isLoading = RxBool(false); // si esta cargando

  //funcion para iniciar sesion
  Future<void> signInWithEmailAndPassword() async {
    try {
      isLoading.value = true;
      error.value = null;
      //llamada a API que recibe los datos del usuario
      await _authRepository.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      error.value = e.toString();
      print(error.value);
      Get.snackbar('Fallo', 'Datos incorrectos, verifíque.',
          snackPosition: SnackPosition.BOTTOM);
    }
    isLoading.value = false;
  }
}
