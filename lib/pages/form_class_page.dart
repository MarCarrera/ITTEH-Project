// ignore_for_file: deprecated_member_use, prefer_const_declarations, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/common/theme_helper.dart';
import '../constans.dart';
import 'home_page.dart';

class FormClassPage extends StatefulWidget {
  const FormClassPage({Key? key}) : super(key: key);

  //static final namePage = "Formulario";

  @override
  _FormClassPageState createState() => _FormClassPageState();
}

class _FormClassPageState extends State<FormClassPage> {
  //llave para identificar el formulario y asociar sus elemntos y pasarlos al listado
  //final idClass = GlobalKey<FormState>();
  //mapa que pasara a clases con atributos especificos de los elementos del formulario
  //Map<String,dynamic> newClass = {};

  @override
  Widget build(BuildContext context) {
    //final controller = FormController();

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
                //key: idClass,
                child: Column(children: <Widget>[
              _crearNombreClase(),
              const SizedBox(height: 20),
              _crearNombreDoc(),
              const SizedBox(height: 20),
              _crearHora(),
              const SizedBox(
                height: 20,
              ),
              _crearAula(),
              const SizedBox(height: 30),
              _botonAgregar()
//-----------------------------------------BOTON AGREGAR---------------------------------//
            ])),
          ),
        ));
  }

  _crearNombreClase() {
    //evento que recibe un valor y se dispara cuando ocurre el evento (A)
    return TextFormField(
        //controller: controller.materiaController,
        decoration: ThemeHelper().textInputDecoration(
            'Nombre de la clase', 'Ingresa nombre de la clase'));
  }

  _crearNombreDoc() {
    return TextFormField(
        onSaved: (valor) {
          //cuando salve, en la nueva clase en la casilla clase guardara lo que se digito
          //newClass['docente']=valor;
        },
        decoration: ThemeHelper()
            .textInputDecoration('Docente', 'Quien imparte la clase'));
  }

  _crearHora() {
    return TextFormField(
        onSaved: (valor) {
          //cuando salve, en la nueva clase en la casilla clase guardara lo que se digito
          //newClass['hora']=valor;
        },
        decoration:
            ThemeHelper().textInputDecoration('Hora de clase', '00:00'));
  }

  _crearAula() {
    return TextFormField(
        onSaved: (valor) {
          //cuando salve, en la nueva clase en la casilla clase guardara lo que se digito
          //newClass['aula']=valor;
        },
        decoration: ThemeHelper().textInputDecoration('Aula', 'Aula'));
  }

  _botonAgregar() {
    return Container(
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
          onPressed: () {
            /*Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItemCardClass(
                          materia: c.text,
                        )));*/
            Get.toNamed('/home');
          }),
    );
  }
}
