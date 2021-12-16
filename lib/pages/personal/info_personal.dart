import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constans.dart';

class InfoPersonal extends StatelessWidget {
  const InfoPersonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Información del Personal"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
            color: kDefaultColorBlue),
        leading: GestureDetector(
          onTap: () {
            Get.toNamed('/personal');
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: kDefaultColorBlue,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 16,
                    right: 16,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 5, color: Colors.white),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.grey.shade300,
                    size: 80.0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(80, 80, 0, 0),
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.grey.shade700,
                    size: 25.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: const Text(
                "Nombre del Docente",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: const Text(
                "Área: Ing. En Sistemas Computacionales",
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: const Text("Correo: ittehnetwork@tehuacan.tecnm.mx"),
            )
          ],
        ),
      ),
    );
  }
}
