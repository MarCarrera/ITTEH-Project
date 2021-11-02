// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constans.dart';

class ItemCardClass extends StatelessWidget {
  
  const ItemCardClass({Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardClass();
  }

  Container CardClass() {
    return Container(
      // este contenedor se usa de FONDO para colocar los demas widgets
      height: 114.0,
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: kDefaultColorBlueTrans),
      // aqui se ocupa Stack para lograr el diseno de las TARJETAS DE INFORMACION
      child: Stack(
        children: [
          //todo ------------ linea junto al texto ------------//
          Container(
            height: 35.0,
            width: 2.0,
            color: kDefaultColorBlue,
            margin: const EdgeInsets.only(left: 15.0, top: 22.0),
          ),
          //todo ------------ Informacion ---------------------//
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 25.0, top: 22.0),
              child: const Text(
                "Gestión de Proyectos de Software \n12:00 - 01:00 pm",
                style: TextStyle(color: kDefaultColorBlue, fontSize: 16.0),
              ),
            ),
          ),
          //todo ------------ icono --------------------------//
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.only(right: 25.0, top: 10.0),
              /*child: const Image(
                image: AssetImage('assets/images/icon_user.png'),
                height: 55,
                width: 55,
              ),*/
            ),
          ),
          // todo ------------- boton ------------------//
          // se uso Align para colocar el BOTON centrado en la parte baja
          Align(
            alignment: Alignment.bottomCenter,
            // el container se uso para poder agregar altura y anchura
            child: Container(
              height: 20.0,
              width: 274.0,
              // la separacion de la parte baja es de 18
              margin: const EdgeInsets.only(bottom: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xffAAAED1)),
                  ),
                  child: const 
                    Text("23-A", style: TextStyle(fontSize: 12.0, color: Color(0xff2c406e))),
                  ),
                  const SizedBox(width: kDefaultPaddin),
                  ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xffAAAED1)),
                  ),
                  child: const 
                    Text("M.C. Elsa Hernández Cortes", style: TextStyle(
                      fontSize: 12.0, 
                      color: Color(0xff2c406e))
                      ),
                  ),
                ]
              )
                  
                  
            ),
          )
        ],
      ),
    );
  }
}
