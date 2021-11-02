// ignore_for_file: prefer_const_declarations
import 'package:flutter/material.dart';

import '../constans.dart';
import 'home_page.dart';

class CareersScreen extends StatelessWidget {
  const CareersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Galería ITTEH'),
        backgroundColor: Colors.white,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: kDefaultColorLightBlue,
          fontSize: 20.0,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: kDefaultColorLightBlue,
          onPressed: () {
            // esto se utilizara para navegar a la pagina principal
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          searchBar(),
          tarjetaCarrera("Ingeniería Electrónica\nDescripción"),
          tarjetaCarrera("Ingeniería Civil\nDescripción"),
          tarjetaCarrera("Ingeniería Mecatrónica\nDescripción"),
          tarjetaCarrera("Ingeniería Industrial\nDescripción"),
          tarjetaCarrera("Ingeniería en Sistemas Computacionales\nDescripción"),
          tarjetaCarrera("Ingeniería en Logística\nDescripción"),
          tarjetaCarrera("Ingeniería en Gestión Empresarial\nDescripción"),
          tarjetaCarrera("Licenciatura en Administración\nDescripción"),
          tarjetaCarrera("Contador Público\nDescripción"),
        ],
      ),
    );
  }

  Container tarjetaCarrera(String text) {
    return Container(
      height: 94.0,
      width: 324,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: cPrimaryColorCa),
      margin: const EdgeInsets.only(
          right: kDefaultPaddin, bottom: 11.0, left: kDefaultPaddin),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Stack(
        children: [
          Container(
            height: 35,
            width: 2.5,
            color: cSecondaryColor,
            margin: const EdgeInsets.only(top: 16.0, right: 10.0),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                margin: const EdgeInsets.only(top: 15.0, left: 10.0),
                child: Text(
                  text,
                  style: const TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Colors.white),
                )),
          )
        ],
      ),
    );
  }

  Row searchBar() {
    return Row(
      children: [
        Container(
          width: 262.0,
          height: 50.0,
          margin: const EdgeInsets.only(
              right: 15.0, bottom: 24.0, left: kDefaultPaddin),
          padding: const EdgeInsets.only(left: kDefaultPaddin),
          decoration: BoxDecoration(
              color: cSearchBar, borderRadius: BorderRadius.circular(15.0)),
          child: const Opacity(
            opacity: 0.3,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search for",
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
        ),
        Container(
          width: 50.0,
          height: 50.0,
          margin: const EdgeInsets.only(bottom: 24.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), color: cSearchBar),
          child: const Opacity(opacity: 0.3, child: Icon(Icons.tune)),
        )
      ],
    );
  }
}
