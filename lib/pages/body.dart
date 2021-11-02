// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home/components.dart/item_card_categorie.dart';
import 'package:home/components.dart/item_card_class.dart';
import 'package:home/constans.dart';
import '../constans.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: builAppBar(),
      body: DetailsCategorie(context),
      );

  }
  AppBar builAppBar(){
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Bienvenido",
        textAlign: TextAlign.left),        
        titleTextStyle: const TextStyle(
            color: kDefaultColorBlue,
            fontSize: 26.0,
          ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/images/icon_setting.png',
              width: 20,
            ),
            onPressed: () {},
          ),
        ]
      );
  }

  ListView DetailsCategorie(BuildContext context) {
    return ListView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        //Welcome(context),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
          ItemCardCategorie(
            text: "Avisos \nGenerales",
            color: kDefaultColorGreen,
            alto: 120,
            ancho: 140,
            image: 'assets/images/icon_avisos.png',
            page: "/notices",
          ),
          ItemCardCategorie(
            text: "Personal Docente \ny Administrativo",
            color: kDefaultColorLila,
            alto: 145,
            ancho: 140,
            image: 'assets/images/icon_team.png',
            page: "/personal",
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
          ItemCardCategorie(
            text: "Ingenierías y Licenciaturas",
            color: kDefaultColorLightBlue,
            alto: 145,
            ancho: 140,
            image: 'assets/images/icon_books.png',
            page: "/careers",
          ),
          ItemCardCategorie(
            text: "Galería ITTEH",
            color: kDefaultColorRed,
            alto: 120,
            ancho: 140,
            image: 'assets/images/icon_gallery.png',
            page: "/gallery",
          ),
        ]),
        //const ListClass(),
        //lista de clases y boton agregar clases
        Message(context),
        //comienza lista de items de clases
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ItemCardClass(),
            SizedBox(height: kDefaultPaddin / 2),
            ItemCardClass(),
            SizedBox(height: kDefaultPaddin / 2),
            ItemCardClass(),
            SizedBox(height: kDefaultPaddin / 2),
            ItemCardClass(),
            SizedBox(height: kDefaultPaddin / 2),
            ItemCardClass(),
            SizedBox(height: kDefaultPaddin / 2),
          ],
        ),
      ],
    );
  }

  Row Message(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            //mainAxisAlignment: MainAxisAlignment.start,
            child: (Text(
              'CLASES DE HOY:',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: kDefaultColorBlue,
                    fontWeight: FontWeight.w300,
                  ),
            ))),
        GestureDetector(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Image.asset(
                'assets/images/icon_agregar.png',
                width: 25,
                color: kDefaultColorBlue,
              ),
            ),
            onTap: () => Get.toNamed('/form'))
      ],
    );
  }
}
