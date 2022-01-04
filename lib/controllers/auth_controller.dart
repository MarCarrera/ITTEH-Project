import 'dart:async';
import 'package:get/get.dart';
import 'package:home/repository/auth_repository.dart';

enum AuthState {
  signedOut, //sesion no iniciada
  signedIn, //sesion iniciada
}

class AuthController extends GetxController {
  //al iniciar la app, se inyecta el Get al AuthRepository creado
  final _authRepository = Get.find<AuthRepository>();
  //suscripcion para saber cuando una sesion fue iniciada
  late StreamSubscription _authSubcription;

  //variable de tipo AuthState para el valor inicial
  final Rx<AuthState> authState = Rx(AuthState.signedOut);
  //variable de tipo AuthUser para el usuario inicial (nulo)
  final Rx<AuthUser?> authUser = Rx(null);

  void _authStateChanged(AuthUser? user) {
    if (user == null) {
      //si cerramos sesion
      authState.value = AuthState.signedOut;
      Get.offAllNamed('/login');
    } else {
      //si iniciamos sesion
      authState.value = AuthState.signedIn;
      Get.offAllNamed('/home');
    }
    authUser.value = user;
  }

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 3));
    _authSubcription =
        _authRepository.onAuthStateChanged.listen(_authStateChanged);
    super.onInit();
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }

  @override
  void onClose() {
    _authSubcription.cancel();
    super.onClose();
  }
}
