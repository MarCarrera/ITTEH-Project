// ignore_for_file: deprecated_member_use, prefer_final_fields

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/controllers/auth_controller.dart';
import 'package:home/repository/implementations/auth_repository.dart';
//import 'package:home/repository/implementations/my_user_repository_imp.dart';
import 'repository/auth_repository.dart';
import 'repository/implementations/my_user_repository.dart';
import 'repository/my_user_repository.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //inyeccion del repositorio al proyecto
  Get.put<AuthRepository>(AuthRepositoryImp());
  Get.put<MyUserRepository>(MyUserRepositoryImp());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: authController,
        builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: '/login',
            navigatorKey: Get.key,
            getPages: routes(),
          );
        });
    //home: const ItemClases(),
  }
}
