import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/models/my_user.dart';
import 'package:home/repository/my_user_repository.dart';
import '../constans.dart';
import 'auth_controller.dart';

class MyUserController extends GetxController {
  //instancia de la clase MyUserRepository
  final _userRepository = Get.find<MyUserRepository>();

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final nControlController = TextEditingController();
  final semesterController = TextEditingController();
  final careerController = TextEditingController();
  final ageController = TextEditingController();
  final aboutMeController = TextEditingController();

  Rx<File?> pickedImage = Rx(null);
  Rx<bool> isLoading = Rx(false);
  Rx<bool> isSaving = Rx(false);
  Rx<MyUser?> user = Rx(null);

  @override
  void onInit() {
    getMyUser();
    super.onInit();
  }

  void setImage(File? imageFile) async {
    pickedImage.value = imageFile;
  }

  Future<void> getMyUser() async {
    isLoading.value = true;
    user.value = await _userRepository.getMyUser();
    nameController.text = user.value?.name ?? '';
    lastNameController.text = user.value?.lastName ?? '';
    nControlController.text = user.value?.nControl.toString() ?? '';
    semesterController.text = user.value?.semester.toString() ?? '';
    careerController.text = user.value?.career ?? '';
    ageController.text = user.value?.age.toString() ?? '';
    aboutMeController.text = user.value?.aboutMe ?? '';
    isLoading.value = false;
  }

  Future<void> saveMyUser() async {
    isSaving.value = true;
    final uid = Get.find<AuthController>().authUser.value!.uid;
    final name = nameController.text;
    final lastName = lastNameController.text;
    final nControl = int.tryParse(nControlController.text) ?? 0;
    final career = careerController.text;
    final semester = int.tryParse(semesterController.text) ?? 0;
    final age = int.tryParse(ageController.text) ?? 0;
    final aboutMe = aboutMeController.text;

    final newUser = MyUser(uid, name, lastName, nControl, career, semester, age,
        aboutMe, //email, password,
        image: user.value?.image);

    user.value = newUser;

    //Guardar usuario en la Base de Datos
    await Future.delayed(const Duration(seconds: 3));
    await _userRepository.saveMyUser(newUser, pickedImage.value);
    isSaving.value = false;
    Get.defaultDialog(
        backgroundColor: kDefaultColorBlue,
        radius: 35,
        title: 'Listo',
        titleStyle: const TextStyle(color: Colors.white, fontSize: 22),
        content: const Text(
          'Sus datos de usuario \nhan sido actualizados.',
          style: TextStyle(color: Colors.white, fontSize: 21),
        ),
        textConfirm: 'Ok',
        confirmTextColor: Colors.white,
        buttonColor: kDefaultColorBlue,
        onConfirm: () {
          Get.toNamed('/profile');
        });
  }
}
