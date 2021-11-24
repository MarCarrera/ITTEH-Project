import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/common/theme_helper.dart';
//import 'package:home/controllers/auth_controller.dart';
import 'package:home/controllers/sign_in_controller.dart';
//import 'package:home/controllers/login_controller.dart';
//import 'package:home/controllers/register_controller.dart';
import 'package:home/controllers/validations.dart';
import '../constans.dart';
//import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(SignInController());
  //final controller = Get.put(LoginController());
  // valida que sean verdaderos los datos del usuario
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<SignInController>(
            init: SignInController(),
            builder: (_) {
              return SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                      _iconLogin(),
                      _textLogin(),
                      const SizedBox(height: 30.0),
                      _inputEmail(),
                      const SizedBox(height: 30.0),
                      _inputPassword(),
                      const SizedBox(height: 15.0),
                      _forgotPassword(),
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
                      _bottonSignIn(context, _),
                      const SizedBox(height: 20.0),
                      _newAccount(),
                    ])),
              );
            }));
  }

  _iconLogin() {
    return Container(
      padding: const EdgeInsets.only(top: 90.0),
      child: const Image(
        image: AssetImage('assets/images/logo_2.png'),
        height: 120,
        width: 120,
      ),
    );
  }

  _textLogin() {
    return Container(
      alignment: Alignment.topCenter,
      height: 50.0,
      //width: .0,
      // la separacion de la parte baja es de 18
      margin: const EdgeInsets.only(top: kDefaultPaddin),
      child: const Text(
        "Inicia sesión",
        style: TextStyle(color: kDefaultColorBlue, fontSize: 40.0),
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

  _forgotPassword() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 50, 20),
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          //Get.toNamed('/forgotpassword');
        },
        child: const Text(
          "¿Olvidaste tu contraseña?",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  _bottonSignIn(BuildContext context, SignInController _) {
    return Container(
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
              'Entrar'.toUpperCase(),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          ),
          onPressed: () async {
            //validar email y password con firebase
            if (_formKey.currentState!.validate()) {
              //Entramos con correo electronico
              /*const Center(
                child: CircularProgressIndicator(),
              );*/
              _.signInWithEmailAndPassword();
              //_.signInWithEmailAndPassword();
              //Get.toNamed('/home');

              /*Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => const HomePage()),
              );*/

            }
          }),
    );
  }

  _newAccount() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      //child: Text('Don\'t have an account? Create'),
      child: Text.rich(TextSpan(children: [
        const TextSpan(text: "¿No tienes una cuenta? "),
        TextSpan(
          text: 'Registrate',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Get.toNamed('/registration');
            },
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: kDefaultColorBlue),
        ),
      ])),
    );
  }
}
