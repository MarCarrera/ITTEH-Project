import 'package:flutter/material.dart';

import '../constans.dart';

class ItemCardNotices extends StatelessWidget {
  const ItemCardNotices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      // se anadio maring en los laterales de igual tamano y en la parte superior se le dio 20.0
      margin: const EdgeInsets.only(top: 20.0, right: 15.0, left: 15.0),
      // se ocupa BoxDecoration para lograr los bordes redondeados y el color
      decoration: BoxDecoration(
          // al borde sera circular
          borderRadius: BorderRadius.circular(15.0),
          // al color se le agrego opacidad de 61%
          color: cPrimaryColorNot.withOpacity(0.61)),
      // Stack se utilizo para poder acomodar los widgets
      child: Stack(
        children: [
          //*----------titulo del aviso---------------*//
          Container(
            // el margin coloca el texto en su lugar
            margin: const EdgeInsets.only(top: 12.0, left: 12.0),
            // esto agrega el texto, la fuente, tamano y color
            child: const Text(
              "Sleepover Night",
              style: TextStyle(
                  fontFamily: "SourceSansPro",
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 14.0),
            ),
          ),
          //*--------recuadro para la imagen---------*//
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 75.0,
              width: 75.0,
              // margin posiciona el container
              margin: const EdgeInsets.only(bottom: 12.0, left: 12.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: cGreyCustom),
            ),
          ),
          //*--------fecha de publicacion-----------*//
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              // margin posiciona el container
              margin: const EdgeInsets.only(top: 41.0, left: 114),
              // esto agrega la fecha de publicacion, la fuente, tamano y color
              child: const Text(
                "06 Jan 21, 09:00 AM",
                style: TextStyle(
                    fontFamily: "SourceSeansPro",
                    fontWeight: FontWeight.w600,
                    color: cFontColor),
              ),
            ),
          ),
          //*-----------icono del reloj-------------*//
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                // margin posiciona el container
                margin: const EdgeInsets.only(top: 42.5, left: 95),
                child: const Icon(
                  Icons.schedule,
                  size: 14.0,
                  color: Color(0xFF6789CA),
                )),
          ),
          //*---------Contenido---------------------*//
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 53.0,
              width: 225.0,
              // margin posiciona el container
              margin:
                  const EdgeInsets.only(left: 95.0, bottom: 13.0, right: 23.0),
              // esto agrega el texto, la fuente, tamano y color
              child: const Text(
                "Con base en la CIRCULAR No. M00/052/202 y en cumplimiento a las “Medidas generales de ...",
                style: TextStyle(
                    fontFamily: "SourceSansPro",
                    fontSize: 13.0,
                    color: Colors.black),
                textAlign: TextAlign.justify,
              ),
            ),
          )
        ],
      ),
    );
  }
}
