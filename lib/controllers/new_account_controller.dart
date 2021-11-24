// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home/repository/auth_repository.dart';

class NewAccountController extends GetxController {
  final _authRepository = Get.find<AuthRepository>();

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final error = Rx<String?>(null); //si existe error
  final isLoading = RxBool(false); // si esta cargando

  String? emailValidator(String? value) {
    return (value == null || value.isEmpty) ? 'Se requiere un email' : null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Se requiere una contraseña';
    return null;
  }

  //funcion para crear el usuario
  Future<void> createUserWithEmailAndPassword() async {
    try {
      isLoading.value = true;
      error.value = null;
      //llamada a API que recibe los datos del usuario
      await _authRepository.createUserWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      error.value = e.toString();
      print(error.value);
      Get.snackbar('Fallo', 'Éste email ya es usado por otro usuario',
          snackPosition: SnackPosition.BOTTOM);
    }
    isLoading.value = false;
  }
}
