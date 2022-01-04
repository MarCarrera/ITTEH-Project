// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home/common/theme_helper.dart';
import 'package:home/components.dart/item_card_categorie.dart';
import 'package:home/components.dart/my_class.dart';
//import 'package:home/components.dart/my_class.dart'
import 'package:home/constans.dart';
import 'package:home/controllers/my_user_controller.dart';
import 'package:image_picker/image_picker.dart';
import '../constans.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(MyUserController());

    return const Scaffold(
      body: BodySection(),
      /*Obx(() {
      if (userController.isLoading.value) {
        return const Center(
            child: CircularProgressIndicator(
          color: kDefaultColorBlue,
          strokeWidth: 3.7,
        ));
      }
      return const BodySection();
    })*/
    );
  }
}

class BodySection extends StatefulWidget {
  const BodySection({
    Key? key,
  }) : super(key: key);

  @override
  State<BodySection> createState() => BodySectionState();
}

class BodySectionState extends State<BodySection> {
  final _formKey = GlobalKey<FormState>();
  final userController = Get.put(MyUserController());
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
//-----------------------------Widget Image Profile-----------------------//
    final imageObx = Obx(() {
      Widget image = const Icon(
        Icons.person,
        color: kDefaultColorBlue,
        size: 30.0,
      );
      if (userController.pickedImage.value != null) {
        image = Image.file(
          userController.pickedImage.value!,
          fit: BoxFit.fill,
        );
      } else if (userController.user.value?.image?.isNotEmpty == true) {
        image = CachedNetworkImage(
          imageUrl: userController.user.value!.image!,
          progressIndicatorBuilder: (_, __, progress) =>
              CircularProgressIndicator(
                  value: progress.progress,
                  color: kDefaultColorBlue,
                  strokeWidth: 3.5),
          errorWidget: (_, __, ___) => const Icon(Icons.error),
          fit: BoxFit.fill,
        );
      }
      return image;
    });
//------------------------------- FINISHED WIDGET--------------------------//
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Bienvenido ${userController.nameController.text}",
              textAlign: TextAlign.left),
          titleTextStyle: const TextStyle(
            color: kDefaultColorBlue,
            fontSize: 20.0,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications, color: kDefaultColorBlue),
              onPressed: () {
                Get.toNamed('/notifications');
              },
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/profile');
              },
              child: Container(
                margin: const EdgeInsets.only(
                  top: 8,
                  right: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 5, color: Colors.white),
                  color: Colors.white,
                ),
                child: ClipOval(
                    child: SizedBox(
                  width: 38,
                  child: imageObx,
                )),
              ),
            ),
          ]),
      body: DetailsCategorie(context),
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
        //lista de clases y boton agregar clases
        Message(context),
        //comienza lista de items de clases
        const MyClass(),
        const SizedBox(
          height: 10,
        ),
        const MyClass(),
        const SizedBox(
          height: 10,
        ),
        const MyClass(),
        const SizedBox(
          height: 10,
        ),
        const MyClass(),
        const SizedBox(
          height: 10,
        ),
        const MyClass(),
        const SizedBox(
          height: 10,
        ),
        const MyClass(),
        const SizedBox(
          height: 10,
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
          //onTap: () => Get.toNamed('/form'))
          onTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Nueva clase"),
              content: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      TextFormField(
                          //controller: _nameController,
                          decoration: ThemeHelper().textInputDecoration(
                              'Nombre de la clase',
                              'Ingresa nombre de la clase'),
                          validator: (text) {
                            if (text!.isNotEmpty) {
                              return null;
                            }
                            return "Dato vacío.";
                          }),
                      const SizedBox(height: 20),
                      TextFormField(
                          //controller: _teacherController,
                          decoration: ThemeHelper().textInputDecoration(
                              'Docente', 'Quien imparte la clase'),
                          validator: (text) {
                            if (text!.isNotEmpty) {
                              return null;
                            }
                            return "Dato vacío.";
                          }),
                      const SizedBox(height: 20),
                      TextFormField(
                          //controller: _timeController,
                          decoration: ThemeHelper()
                              .textInputDecoration('Hora de clase', '00:00'),
                          validator: (text) {
                            if (text!.isNotEmpty) {
                              return null;
                            }
                            return "Dato vacío.";
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          //controller: _classroomController,
                          decoration:
                              ThemeHelper().textInputDecoration('Aula', 'Aula'),
                          validator: (text) {
                            if (text!.isNotEmpty) {
                              return null;
                            }
                            return "Dato vacío.";
                          }),
                    ]),
                  )),
              actions: [
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  /*_NewClass(MyClass myClass) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        // este contenedor se usa de FONDO para colocar los demas widgets
        height: 80.0,
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: kDefaultColorVino),
        // aqui se ocupa Stack para lograr el diseno de las TARJETAS DE INFORMACION
        child: Stack(
          children: [
            //todo ------------ Informacion ---------------------//
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 25.0, top: 20.0),
                child: Text(
                  myClass.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            // todo ------------- boton ------------------//
            // se uso Align para colocar el BOTON centrado en la parte baja
            Align(
              //alignment: Alignment.bottomCenter,
              // el container se uso para poder agregar altura y anchura
              child: Container(
                  //padding: const EdgeInsets.only(top: 10),
                  height: 20.0,
                  width: 274.0,
                  // la separacion de la parte baja es de 18
                  margin: const EdgeInsets.only(top: 40, bottom: 18.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("14th November",
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white)),
                        SizedBox(width: kDefaultPaddin),
                        Text("Saturday",
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white)),
                      ])),
            )
          ],
        ),
      ),
    );
  }*/
}
