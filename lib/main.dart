// ignore_for_file: deprecated_member_use, prefer_final_fields

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        /*textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white),*/
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //primaryColor: _primaryColor,
        //accentColor: _accentColor,
        //scaffoldBackgroundColor: Colors.grey.shade100,
        //primarySwatch: Colors.grey,
      ),
      initialRoute: '/login',
      navigatorKey: Get.key,
      getPages: routes(),

      
    );
    //home: const ItemClases(),
  }
}
