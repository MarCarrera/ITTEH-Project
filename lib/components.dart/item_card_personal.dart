// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constans.dart';

class ItemCardPersonal extends StatelessWidget {
  
  const ItemCardPersonal({Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardPersonal();
  }

  Container CardPersonal() {
    return Container(
      // este contenedor se usa de FONDO para colocar los demas widgets
      height: 114.0,
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: cPrimaryColor),
      // aqui se ocupa Stack para lograr el diseno de las TARJETAS DE INFORMACION
      child: Stack(
        children: [
          //todo ------------ linea junto al texto ------------//
          Container(
            height: 35.0,
            width: 2.0,
            color: Colors.white,
            margin: const EdgeInsets.only(left: 15.0, top: 22.0),
          ),
          //todo ------------ Informacion ---------------------//
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 25.0, top: 22.0),
              child: const Text(
                "Luis Andres Duran Robles \n07:00 - 08:00",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ),
          //todo ------------ icono --------------------------//
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.only(right: 25.0, top: 10.0),
              child: const Image(
                image: AssetImage('assets/images/icon_user.png'),
                height: 55,
                width: 55,
              ),
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
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(cSecundaryColor),
                  ),
                  child: const Text("Sistemas Computacionales",
                      style: TextStyle(fontSize: 12.0, color: cFont))),
            ),
          )
        ],
      ),
    );
  }
}
