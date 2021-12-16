import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constans.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // todo estos elementos son reciclados de las paginas anteriores para que tengan el mismo aspecto
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0, // quita la sombra inferior del appbar
          title: const Text("Notificaciones"), // dara el titulo a la pantalla
          centerTitle: true, //centra el titulo
          titleTextStyle: const TextStyle(
              // le da los estilos a la fuente
              fontFamily: "Roboto",
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: kDefaultColorBlue),
          leading: GestureDetector(
            onTap: () {
              Get.toNamed('/home');
            },
            child: const Icon(
              // aqui agrega el boton con el icono de retroceso
              Icons.arrow_back_ios_new,
              color: kDefaultColorBlue,
            ),
          ),
        ),
        body: ListView(
          //listview es para realizar el scroll
          physics: const BouncingScrollPhysics(
              // complementa al listview para darle un efecto al terminar de scrollear
              parent:
                  AlwaysScrollableScrollPhysics()), // es necesario apra el BouncingScrollPhysics
          children: [
            Column(
              children: [
                // para lograr las notificaciones se agrego un metodo para solo ingresar la hora de notificacion, es solo para presentacion
                notificationCard("12:30 hrs"),
                notificationCard("12:00 hrs"),
                notificationCard("11:30 hrs"),
                notificationCard("11:10 hrs"),
                notificationCard("11:00 hrs"),
                notificationCard("10:00 hrs"),
                notificationCard("09:16 hrs"),
                notificationCard("09:15 hrs"),
                notificationCard("09:00 hrs"),
              ],
            )
          ],
        ));
  }

  Container notificationCard(String text) {
    return Container(
      //este container es el fondo de la notificacion
      height: 60.0,
      width: 320,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: cNotPrimaryColor),
      margin: const EdgeInsets.only(
          right: kDefaultPaddin, bottom: 8.0, left: kDefaultPaddin),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Stack(
        // stack es usado para lograr el comodo de los demas widgets
        children: [
          Container(
            //este container es usado para la barrita color blanca a la izquierda
            height: 35.0,
            width: 2.5,
            color: cSecondaryColor,
            margin: const EdgeInsets.only(top: 13.0, right: 10.0),
          ),
          Align(
            // align se utiliza para posicionar el texto
            alignment: Alignment.topLeft,
            child: Container(
                // este container contiene el texto
                margin: const EdgeInsets.only(top: 12.0, left: 10.0),
                child: const Text(
                  "¡Nueva Notificacion!",
                  style: TextStyle(
                      // aqui se dan el estilo al texto
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Colors.white),
                )),
          ),
          Align(
            // align se utiliza para posicionar el texto
            alignment: Alignment.topLeft,
            child: Container(
                // este container contiene el texto
                margin: const EdgeInsets.only(top: 32.0, left: 10.0),
                child: Text(
                  text,
                  style: const TextStyle(
                      //aqui se le da estilo al texto
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Colors.white),
                )),
          ),
          SizedBox(
            //este sizedbox se utiliza para agregar un boton a la notificacion y acceder a ella si es necesario
            width: double.infinity,
            height: double.infinity,
            child: TextButton(
              onPressed: () {},
              child: const Text(""),
            ),
          ),
        ],
      ),
    );
  }
}
