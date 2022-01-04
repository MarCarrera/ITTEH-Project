// ignore_for_file: deprecated_member_use, sized_box_for_whitespace
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/controllers/auth_controller.dart';
import 'package:home/controllers/my_user_controller.dart';
import 'package:image_picker/image_picker.dart';
import '../../constans.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(MyUserController());

    return const Scaffold(
      body: MyUserSection(),
      /*body: Obx(() {
      if (userController.isLoading.value) {
        return const Center(
            child: CircularProgressIndicator(
          color: kDefaultColorBlue,
          strokeWidth: 3.7,
        ));
      }
      return const MyUserSection();
    })*/
    );
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
  final userController = Get.put(MyUserController());
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
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
        leading: IconButton(
          onPressed: () {
            Get.toNamed('/home');
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: kDefaultColorBlue,
        ),
      ),
      //SystemNavigator.pop(); //salir
      body: Stack(
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
                    )
                  ],
                ),
                //),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  if (Get.find<AuthController>().authState.value ==
                      AuthState.signedIn) {
                    return Center(
                      child: Text(
                        userController.nameController.text.isEmpty
                            ? 'Student name'
                            : userController.nameController.text +
                                ' ' +
                                userController.lastNameController.text,
                        style: const TextStyle(fontSize: 19),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 4.0),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "User Information",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/editProfile');
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 185.0, bottom: 4.0),
                              alignment: Alignment.topLeft,
                              child: const Icon(Icons.edit,
                                  color: kDefaultColorGrey),
                            ),
                          ),
                        ],
                      ),
                      Card(
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 140,
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 12),
                                      leading: const Icon(Icons.code),
                                      title: const Text("Matricula"),
                                      subtitle: Text(userController
                                          .nControlController.text),
                                    ),
                                  ),
                                  Container(
                                    width: 140,
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 12),
                                      leading: const Icon(Icons.star),
                                      title: const Text("Carrera"),
                                      subtitle: Text(
                                          userController.careerController.text),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  _lineGrey(),
                                  const SizedBox(width: 10),
                                  _lineGrey(),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 140,
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 12),
                                      leading: const Icon(Icons.grade),
                                      title: const Text("Semestre"),
                                      subtitle: Text(userController
                                              .semesterController.text.isEmpty
                                          ? ''
                                          : "${userController.semesterController.text}º"),
                                    ),
                                  ),
                                  Container(
                                    width: 140,
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 12),
                                      leading: const Icon(Icons.date_range),
                                      title: const Text("Edad"),
                                      subtitle: Text(
                                          userController.ageController.text),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  _lineGrey(),
                                  const SizedBox(width: 10),
                                  _lineGrey(),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Column(
                                children: <Widget>[
                                  ...ListTile.divideTiles(
                                    color: Colors.grey,
                                    tiles: [
                                      ListTile(
                                        leading: const Icon(Icons.person),
                                        title: const Text("Acerca de mi"),
                                        subtitle: Text(userController
                                            .aboutMeController.text),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _lineGrey() {
    return Container(
      height: 0.8,
      width: 135.0,
      color: Colors.grey,
    );
  }
}
