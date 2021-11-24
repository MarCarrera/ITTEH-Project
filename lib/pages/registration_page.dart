// ignore_for_file: deprecated_member_use, non_constant_identifier_names, must_be_immutable
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/common/theme_helper.dart';
import 'package:home/controllers/new_account_controller.dart';
//import 'package:home/controllers/register_controller.dart';
//import 'package:home/controllers/registration_controller.dart';
import 'package:home/controllers/validations.dart';
import '../constans.dart';

class RegistrationPage extends StatelessWidget {
  final controller = Get.put(NewAccountController());
  //final controller = Get.put(RegistrationController());
  final _formKey = GlobalKey<FormState>();

  RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<NewAccountController>(
            init: NewAccountController(),
            builder: (_) {
              return SingleChildScrollView(
                child: AbsorbPointer(
                  absorbing: controller.isLoading.value,
                  child: Form(
                      key: _formKey,
                      child: Column(children: [
                        const SizedBox(height: 60.0),
                        _iconPerson(),
                        const SizedBox(height: 20.0),
                        _inputName(),
                        const SizedBox(height: 20.0),
                        _inputLastName(),
                        const SizedBox(height: 20.0),
                        _inputEmail(),
                        const SizedBox(height: 20.0),
                        _inputPassword(),
                        const SizedBox(height: 15.0),
                        //funcion de GetX
                        Obx(
                          () => Visibility(
                              visible: controller.isLoading.value,
                              child: const Center(
                                  child: CircularProgressIndicator(
                                color: kDefaultColorBlue,
                                strokeWidth: 3.5,
                              ))),
                        ),
                        const SizedBox(height: 10.0),
                        //-------------------------------------------BOTON REGISTRO-------------------------------------//
                        Container(
                          height: 40,
                          width: 260,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kDefaultColorBlue,
                          ),
                          child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  'Registrarme'.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                ),
                              ),
                              onPressed: () async {
                                //validar email y password con firebase
                                if (_formKey.currentState!.validate()) {
                                  //Reisgro de nueva cuenta con correo electronico
                                  //_.register();
                                  _.createUserWithEmailAndPassword();
                                }
                              }),
                        ),
                        _signIn(context),
                      ])),
                ),
              );
            }));
  }

  _iconPerson() {
    return GestureDetector(
      child: Stack(
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
    );
  }

  _inputName() {
    return Container(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: TextFormField(
        //controller: controller,
        decoration: ThemeHelper().textInputDecoration(
          'Nombre',
          'Ingresa tu nombre',
        ),
        //onChanged: controller.onNameChanged,
        validator: (text) {
          if (text == null) return null;
          return isValidName(text) ? null : "Nombre inválido";
        },
      ),
    );
  }

  _inputLastName() {
    return Container(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: TextFormField(
        //controller: controller,
        decoration: ThemeHelper()
            .textInputDecoration('Apellidos', 'Ingresa tus apellidos'),
        //onChanged: controller.onLastNameChanged,
        validator: (text) {
          if (text == null) return null;
          return isValidLastName(text) ? null : "Apellidos inválidos";
        },
      ),
    );
  }

  _inputEmail() {
    //evento que recibe un valor y se dispara cuando ocurre el evento (A)
    return Container(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: TextFormField(
          //controlador email
          controller: controller.emailController,
          decoration:
              ThemeHelper().textInputDecoration('Email', 'Ingresa tu email'),
          validator: (text) {
            if (text == null) return null;
            return isValidEmail(text)
                ? null
                : "Dirección de correo electrónico inválida";
          }),
    );
  }

  _inputPassword() {
    //evento que recibe un valor y se dispara cuando ocurre el evento (A)
    return Container(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: TextFormField(
        //controlador password
        controller: controller.passwordController,
        obscureText: true,
        decoration: ThemeHelper()
            .textInputDecoration('Contraseña', 'Ingresa una contraseña'),
        validator: (text) {
          if (text == null) return null;
          if (text.trim().length >= 8) {
            return null;
          }
          return "La contraseña debe tener mínimo 8 digitos";
        },
      ),
    );
  }

  _signIn(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      //child: Text('Don\'t have an account? Create'),
      child: Text.rich(TextSpan(children: [
        const TextSpan(text: "¿Ya tienes una cuenta? "),
        TextSpan(
          text: 'Inicia sesión',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Get.toNamed('/login');
            },
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: kDefaultColorBlue),
        ),
      ])),
    );
  }
}
