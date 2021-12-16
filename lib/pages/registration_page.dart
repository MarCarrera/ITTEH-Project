// ignore_for_file: deprecated_member_use, non_constant_identifier_names, must_be_immutable
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/common/theme_helper.dart';
import 'package:home/controllers/my_user_controller.dart';
//import 'package:home/controllers/my_user_controller.dart';
import 'package:home/controllers/new_account_controller.dart';
//import 'package:home/controllers/register_controller.dart';
//import 'package:home/controllers/registration_controller.dart';
import 'package:home/controllers/validations.dart';
import '../constans.dart';

class RegistrationPage extends StatelessWidget {
  final controller = Get.put(NewAccountController());
  final userController = Get.put(MyUserController());

  final _formKey = GlobalKey<FormState>();

  RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(children: [
              _iconWelcome(),
              const SizedBox(height: 30.0),
              _inputEmail(),
              const SizedBox(height: 30.0),
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
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                        controller.createUserWithEmailAndPassword();
                        userController.saveMyUser();
                      }
                    }),
              ),
              const SizedBox(height: 10.0),
              _signIn(context),
            ])),
      ),
    );
    //}

    //));
  }

  _iconWelcome() {
    return Container(
      height: 235,
      width: 235,
      padding: const EdgeInsets.only(top: 75.0, bottom: 30),
      child: const Image(
        image: AssetImage('assets/images/user_register.png'),
      ),
    );
  }

  _inputEmail() {
    //evento que recibe un valor y se dispara cuando ocurre el evento (A)
    return Container(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: TextFormField(
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
