//clase para abstraer al usuario de Firebase
import 'package:equatable/equatable.dart';

//tomar el uid del usuario de Firestore o Database
class AuthUser extends Equatable {
  final String uid;
  const AuthUser(this.uid);

  @override
  List<Object?> get props => [uid];
}

//clase abstracta
abstract class AuthRepository {
  AuthUser? get authUser;
  //escuchar cuando el estado de autenticacion cambia
  //"autenticado, no autenticado"
  Stream<AuthUser?> get onAuthStateChanged;
  //funcion para iniciar sesion con EmailPassword
  Future<AuthUser?> signInWithEmailAndPassword(String email, String password);
  //funcion para crear usuario con EmailPassword
  Future<AuthUser?> createUserWithEmailAndPassword(
      String email, String password);
  //iniciar sesion anonimamente
  Future<AuthUser?> signInAnonymously();
  //funcion para cerrar sesion
  Future<void> signOut();
}
