// ignore_for_file: deprecated_member_use, sized_box_for_whitespace

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/controllers/my_user_controller.dart';
import 'package:image_picker/image_picker.dart';

import '../../constans.dart';
//import 'data_user.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(MyUserController());

    return Scaffold(body: Obx(() {
      if (userController.isLoading.value) {
        return const Center(
            child: CircularProgressIndicator(
          color: kDefaultColorBlue,
          strokeWidth: 3.7,
        ));
      }
      return const MyUserSection();
    }));
  }
}

class MyUserSection extends StatefulWidget {
  const MyUserSection({
    Key? key,
  }) : super(key: key);

  @override
  State<MyUserSection> createState() => MyUserSectionState();
}

class MyUserSectionState extends State<MyUserSection> {
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<MyUserController>();

    final imageObx = Obx(() {
      Widget image = Icon(
        Icons.person,
        color: Colors.grey.shade300,
        size: 80.0,
      );
      if (userController.pickedImage.value != null) {
        image = Image.file(
          userController.pickedImage.value!,
          fit: BoxFit.fill,
        );
      } else if (userController.user.value?.image?.isNotEmpty == true) {
        image = CachedNetworkImage(
          imageUrl: userController.user.value!.image!,
          progressIndicatorBuilder: (_, __, progress) =>
              CircularProgressIndicator(
                  value: progress.progress,
                  color: kDefaultColorBlue,
                  strokeWidth: 3.5),
          errorWidget: (_, __, ___) => const Icon(Icons.error),
          fit: BoxFit.fill,
        );
      }
      return image;
    });

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          // esta linea agrega el boton con icono para regresar y se agrega color
          leading: IconButton(
            onPressed: () {
              Get.toNamed('/profile');
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            color: kDefaultColorBlue,
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: Colors.white,
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 8,
                            right: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 5, color: Colors.white),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 20,
                                offset: Offset(5, 5),
                              ),
                            ],
                          ),
                          child: ClipOval(
                              child: SizedBox(
                            width: 100,
                            height: 100,
                            child: imageObx,
                          )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final pickedImage = await picker.pickImage(
                                source: ImageSource.gallery);
                            if (pickedImage != null) {
                              Get.find<MyUserController>()
                                  .setImage(File(pickedImage.path));
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(80, 90, 0, 0),
                            child: const Icon(
                              Icons.add_circle,
                              color: kDefaultColorBlue,
                              size: 32.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  TextField(
                                    controller: userController.nameController,
                                    decoration: const InputDecoration(
                                        labelText: 'Nombre(s)'),
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    controller:
                                        userController.lastNameController,
                                    decoration: const InputDecoration(
                                        labelText: 'Apellidos'),
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    controller:
                                        userController.nControlController,
                                    decoration: const InputDecoration(
                                        labelText: 'Matricula'),
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    controller:
                                        userController.semesterController,
                                    decoration: const InputDecoration(
                                        labelText: 'Semestre'),
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    controller: userController.careerController,
                                    decoration: const InputDecoration(
                                        labelText: 'Carrera en curso'),
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    controller: userController.ageController,
                                    decoration: const InputDecoration(
                                        labelText: 'Edad'),
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    controller:
                                        userController.aboutMeController,
                                    decoration: const InputDecoration(
                                        labelText: 'Acerca de mi...'),
                                  ),
                                  const SizedBox(height: 20),
                                  Obx(() {
                                    final isSaving =
                                        userController.isSaving.value;
                                    return Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ElevatedButton(
                                            // ignore: prefer_const_constructors
                                            style: ElevatedButton.styleFrom(
                                              primary: kDefaultColorBlue,
                                              //onPrimary: Colors.blue,
                                            ),
                                            child:
                                                const Text('Guardar cambios'),
                                            onPressed: isSaving
                                                ? null
                                                : () =>
                                                    userController.saveMyUser(),
                                          ),
                                          if (isSaving)
                                            const CircularProgressIndicator(
                                              color: kDefaultColorBlue,
                                              strokeWidth: 3.7,
                                            )
                                        ]);
                                  })
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
