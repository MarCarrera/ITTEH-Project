// ignore_for_file: prefer_const_declarations, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:home/common/theme_helper.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  static final namePage = "Formulario";

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario "),
      ),
      body: Form(
        child: Column(
          children:<Widget>[
            _crearNombreClase(),
            const SizedBox(height: 20),
            _crearNombreDoc(),
            const SizedBox(height: 20),
            _crearHora(),
            const SizedBox(height: 20,),
            _crearAula(),
            const SizedBox(height: 30),
            //_botonAgregar(context),
            RaisedButton(
              onPressed: () {},
              child: const Text('Agregar a Horario'),),

          ]
        )
      )
    );
  }

  _crearNombreClase() {
    //evento que recibe un valor y se dispara cuando ocurre el evento (A)
    return TextFormField(
      /*onSaved:(valor){
        //cuando salve, en la nueva clase en la casilla clase guardara lo que se digito
      //newClass['clase']=valor;
    
    },*/
      decoration: ThemeHelper().textInputDecoration(
        'Nombre de la clase', 'Ingresa nombre de la clase'));
  }
  _crearNombreDoc() {
    return TextFormField(
      /*onSaved:(valor){
        //cuando salve, en la nueva clase en la casilla clase guardara lo que se digito
      //newClass['docente']=valor;
    
    },*/
        decoration: ThemeHelper()
            .textInputDecoration('Docente', 'Quien imparte la clase'));
  }
  _crearHora() {
    return TextFormField(
      /*onSaved:(valor){
        //cuando salve, en la nueva clase en la casilla clase guardara lo que se digito
      //newClass['hora']=valor;
    
    },*/
        decoration:
            ThemeHelper().textInputDecoration('Hora de clase', '00:00'));
  }
  _crearAula() {
    return TextFormField(
      /*onSaved:(valor){
        //cuando salve, en la nueva clase en la casilla clase guardara lo que se digito
      //newClass['aula']=valor;
    
    },*/
        decoration: ThemeHelper().textInputDecoration('Aula', 'Aula'));
  }
}
