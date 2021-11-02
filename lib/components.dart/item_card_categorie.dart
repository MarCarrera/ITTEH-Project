// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constans.dart';

class ItemCardCategorie extends StatelessWidget {
  final Color color;
  final String image;
  final String page;
  final String text;
  final double alto;
  final double ancho;

  const ItemCardCategorie({
    Key? key,
    required this.color,
    required this.image,
    required this.page,
    required this.text,
    required this.alto,
    required this.ancho,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(page),
      child: Container(
        // este contenedor se usa de FONDO para colocar los demas widgets
        height: alto,
        width: ancho,
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPaddin * 0.35),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: color.withOpacity(0.61),
            boxShadow: const [
              BoxShadow(
                color: kDefaultColorGrey,
                blurRadius: 8,
                offset: Offset(4, 8),
              )
            ]),
        // aqui se ocupa Stack para lograr el diseno de las TARJETAS DE INFORMACION
        child: Stack(
          children: [
            //todo ------------ icono --------------------------//
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(right: 15.0, top: 5.0),
                child: Image(
                  image: AssetImage(image),
                  height: 65,
                  width: 65,
                ),
              ),
            ),
            //todo ------------ Informacion ---------------------//
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(left: 15.0, top: 15.0),
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
