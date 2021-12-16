// ignore_for_file: deprecated_member_use, prefer_const_declarations, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/common/theme_helper.dart';
import '../constans.dart';
import 'home_page.dart';

class FormClassPage extends StatefulWidget {
  final String nameClass;
  final String teacher;
  final String time;
  final String classroom;

  const FormClassPage({
    Key? key,
    required this.nameClass,
    required this.teacher,
    required this.time,
    required this.classroom,
  }) : super(key: key);

  @override
  _FormClassPageState createState() => _FormClassPageState();
}

class _FormClassPageState extends State<FormClassPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameClassController = TextEditingController();
  final TextEditingController _teacherController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _classroomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text("Agregar Clase"),
          centerTitle: true,
          // en este titleTextStyle damos color y tamano a la fuente
          titleTextStyle: const TextStyle(
            color: kDefaultColorBlue,
            fontSize: 20.0,
          ),
          // el color del appbar es blanco
          backgroundColor: Colors.white,
          // leading se ocupa para colocar el icono para la searchbar
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            color: kDefaultColorBlue,
            onPressed: () {
              // esto se utilizara para navegar a la pagina principal
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
//-------------------------------ENTRADA NOMBRE CLASE--------------------------//
                  TextFormField(
                      controller: _nameClassController,
                      decoration: ThemeHelper().textInputDecoration(
                          'Nombre de la clase', 'Ingresa nombre de la clase'),
                      validator: (text) {
                        if (text!.isNotEmpty) {
                          return null;
                        }
                        return "Dato vacío.";
                      }),

//-------------------------------ENTRADA NOMBRE DOCENTE--------------------------//
                  const SizedBox(height: 20),
                  TextFormField(
                      controller: _teacherController,
                      decoration: ThemeHelper().textInputDecoration(
                          'Docente', 'Quien imparte la clase'),
                      validator: (text) {
                        if (text!.isNotEmpty) {
                          return null;
                        }
                        return "Dato vacío.";
                      }),

//-------------------------------ENTRADA HORA CLASE------------------------------//
                  const SizedBox(height: 20),
                  TextFormField(
                      controller: _timeController,
                      decoration: ThemeHelper()
                          .textInputDecoration('Hora de clase', '00:00'),
                      validator: (text) {
                        if (text!.isNotEmpty) {
                          return null;
                        }
                        return "Dato vacío.";
                      }),
//-------------------------------ENTRADA NOMBRE AULA-----------------------------//
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      controller: _classroomController,
                      decoration:
                          ThemeHelper().textInputDecoration('Aula', 'Aula'),
                      validator: (text) {
                        if (text!.isNotEmpty) {
                          return null;
                        }
                        return "Dato vacío.";
                      }),
//------------------------------------BOTON AGREGAR------------------------------//
                  const SizedBox(height: 30),
                  Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kDefaultColorBlue,
                    ),
                    child: ElevatedButton(
                        style: ThemeHelper().buttonStyle(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            'Agregar'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Get.toNamed('/home');
                          }
                        }),
                  ),
                ])),
          ),
        ));
  }
}
