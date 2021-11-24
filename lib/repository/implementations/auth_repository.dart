// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import '../auth_repository.dart';

class AuthRepositoryImp extends AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  // Si el usuario no es nulo, obtiene el uid del usuario del repositorio de Firebase
  AuthUser? _userFromFirebase(User? user) =>
      user == null ? null : AuthUser(user.uid);

  // Recibe un usuario y lo convierte a un AuthUser
  @override
  AuthUser? get authUser => _userFromFirebase(_firebaseAuth.currentUser);

  @override
  // Se crea una suscrpcion a FirebaseAuth y cada que cambie el estado, se manda a llamar
  //a la funcion "_userFromFirebase" y regresara un usuario nulo, no nulo.
  Stream<AuthUser?> get onAuthStateChanged =>
      _firebaseAuth.authStateChanges().asyncMap(_userFromFirebase);

  //Funcion para crear usuario
  @override
  Future<AuthUser?> createUserWithEmailAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
        
      );
    return _userFromFirebase(authResult.user);
  }

  //Funcion para iniciar sesion
  @override
  Future<AuthUser?> signInWithEmailAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<AuthUser?> signInAnonymously() async {
    final user = await _firebaseAuth.signInAnonymously();
  }
}
