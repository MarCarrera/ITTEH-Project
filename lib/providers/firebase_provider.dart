import 'package:path/path.dart' as path;
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:home/models/my_user.dart';

class FirebaseProvider {
  //get para obtener el usuario actual
  User get currentUser {
    //usuario autenticado
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('Usuario no autenticado.');
    return user;
  }

  //get para obtener la libreria de firestore
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  //get para obtener la libreria de firestorage
  FirebaseStorage get storage => FirebaseStorage.instance;

  //(Leer la base de datos) Obtener un usuario
  Future<MyUser?> getUser() async {
    //lee documento en dicha ruta
    final snapshot = await firestore.doc('user/${currentUser.uid}').get();
    //verificar si existe el snapshot, si es asi, regresa los datos del usuario
    if (snapshot.exists) return MyUser.fromFirebaseMap(snapshot.data()!);
    return null;
  }

  //(Escribir en la base de datos) Guardar usuario
  Future<void> saveUser(MyUser user, File? image) async {
    //crear referencia a FireStore
    final ref = firestore.doc('user/${currentUser.uid}');
    if (image != null) {
      final imagePath =
          '${currentUser.uid}/profile/${path.basename(image.path)}';
      final storageRef = storage.ref(imagePath);
      await storageRef.putFile(image);
      final url = await storageRef.getDownloadURL();
      await ref.set(
          user.toFirebaseMap(newImage: url), SetOptions(merge: true));
    } else {
      //Solo guardar el usuario
      await ref.set(user.toFirebaseMap(), SetOptions(merge: true));
    }
  }
}
