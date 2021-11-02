// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:home/components.dart/item_card_notices.dart';
import 'package:home/pages/home_page.dart';
import '../constans.dart';

class ScreenNotices extends StatelessWidget {
  const ScreenNotices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Avisos Generales'),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: cPrimaryColorNot,
          fontSize: 20.0,
        ),
        // esta linea agrega el boton con icono para regresar y se agrega color
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: cPrimaryColorNot,
        ),
      ),
      body: ListView(
        // usamos listView para poder hacer el listado de aviso que se agregaran y se anadio un efecto al hacer scroll
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          //const SizedBox(height: kDefaultPaddin),
          //*--------------------------- Apartir de aqui se implementa la SearchBar -----------------------*//
          // se uso row para comodar los elementos como se planeo
          SearchBar(),
          //*-------------------------------- los avisos comienzan aqui -----------------------------*//
          //!-------------------------------- tarjeta de aviso --------------------------------------!//
          //*------------ fondo ----------------*//
          const ItemCardNotices(),
          const ItemCardNotices(),
          const ItemCardNotices(),
          const ItemCardNotices(),
          const ItemCardNotices(),
          const ItemCardNotices(),
          const ItemCardNotices(),
          const ItemCardNotices(),
        ],
      ),
    );
  }

  Row SearchBar() {
    return Row(
      // esta linea centra el contenido de row (entrada de busqueda y el boton)
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //*------ entrada de busqueda ------*//

        Container(
          height: 50.0,
          width: 262.0,
          // una vez definido el tamano del contenedor agregamos padding para centrar lo que habra dentro del container
          padding: const EdgeInsets.only(left: kDefaultPaddin),
          // con boxDecoration agregamos bordes circulares y asignamos el color
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), color: cSearchBar),
          // con TextField haremos la entrada de busqueda
          child: const Opacity(
            opacity: 0.2,
            child: TextField(
              decoration: InputDecoration(
                  // esta linea coloca el texto Search for
                  hintText: "Search for",
                  // focusBorder y enableBorder elimina efectos del borde no deseados
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  // suffixIcon agrega el icono de una lupa, su color y tamano
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 20.0,
                  )),
            ),
          ),
        ),
        //*------- boton de filtrado ---------*//
        Container(
          width: 50.0,
          height: 50.0,
          // agregamos padding para acomodar el contenido del container
          margin: const EdgeInsets.only(left: 13.0),
          // con boxDecoration hacemos los bordes cirulares
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), color: cSearchBar),
          // para lograr la opacidad se ocupa Opacity
          child: Opacity(
            opacity: 0.2,
            // esto agrega el boton con icono y su color
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.tune,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
