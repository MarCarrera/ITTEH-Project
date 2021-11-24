// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/components.dart/item_card_personal.dart';
import '../constans.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Personal"),
        centerTitle: true,
        // en este titleTextStyle damos color y tamano a la fuente
        titleTextStyle: const TextStyle(
          color: cPrimaryColor,
          fontSize: 20.0,
        ),
        // el color del appbar es blanco
        backgroundColor:  Colors.white,
        // leading se ocupa para colocar el icono para la searchbar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: cPrimaryColor,
          onPressed: () {
            // esto se utilizara para navegar a la pagina principal
            Get.toNamed('/home');
          }, 
        ),
      ),
      body: ListView(
        // para lograr el efecto de rebote se utilizo physics: BouncingScrollPhysics y parent forma parte tambien de este
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          //* -------------------------diseno de la SearchBar----------------------------------------------------//
          SearchBar(),
          //* --------------------------APARTIR DE AQUI SE EMPIEZA A DISENAR LA INFORMACION DEL PERSONAL--------------------------------------//
          //todo ---------------- Tarjeta de informacion ---------------------------------//
          const ItemCardPersonal(),
          const SizedBox(height: kDefaultPaddin/2),
          const ItemCardPersonal(),
          const SizedBox(height: kDefaultPaddin/2),
          const ItemCardPersonal(),
          const SizedBox(height: kDefaultPaddin/2),
          const ItemCardPersonal(),
          const SizedBox(height: kDefaultPaddin/2),
          const ItemCardPersonal(),
          const SizedBox(height: kDefaultPaddin/2),
          const ItemCardPersonal(),
          const SizedBox(height: kDefaultPaddin/2),
          const ItemCardPersonal(),
          const SizedBox(height: kDefaultPaddin/2),
          const ItemCardPersonal(),
          const SizedBox(height: kDefaultPaddin/2),
          const ItemCardPersonal(),
          const SizedBox(height: kDefaultPaddin/2),
          const ItemCardPersonal(),
          const SizedBox(height: kDefaultPaddin/2),
          
          

 
        ],
      ),
    );
  }

  Row SearchBar() {
    return Row(
          // esto se utiliza para centrar los widgets
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // todo ------------- entrada de busqueda ------------------------- //
            Container(
              alignment: Alignment.center,
              height: 50.0,
              width: 262.0,
              // padding para el texto de search for
              padding: const EdgeInsets.only(left: kDefaultPaddin),
              // margin para separar el container
              margin: const EdgeInsets.only(bottom: kDefaultPaddin),
              // con esto se logran los bordes redondeados
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: cSearchBar,
              ),
              // para lograr la opacidad de los elementos que tiene la searchbar se ocupo Opacity con un valor de 0.3
              child: const Opacity(
                opacity: 0.2,
                // para que al contenedor de le pudiera dar entrada se ocupo TextField y un InputDecoration
                child: TextField(
                  decoration: InputDecoration(
                    // muestra el texto "Search for" en el textfield
                    hintText: "Search for",
                    // deshabilita los efectos predeterminados de los bordes
                    enabledBorder: InputBorder.none,
                    // deshabilita los efectos predeterminados de los bordes
                    focusedBorder: InputBorder.none,
                    // con suffixIcon se logra colocar el icono de la lupa y se agrega el tamano y el color
                    suffixIcon: Icon(
                      Icons.search,
                      size: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            // todo -------- este conteiner es para BOTON DE FILTRADO ------------//
            Container(
                height: 50.0,
                width: 50.0,
                margin: const EdgeInsets.only(
                    left: 13.0, bottom:  kDefaultPaddin),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: cSearchBar),
                // de nuevo se uso Opacity para lograr la opacidad del diseno
                child: Opacity(
                  opacity: 0.2,
                  // para el icono se utilizo IconButton
                  child: IconButton(
                      // esto se utilizara para la accion del boton
                      onPressed: () {},
                      icon: const Icon(
                        Icons.tune,
                        color: Colors.black,
                      )),
                )),
          ],
        );
  }

  
}
