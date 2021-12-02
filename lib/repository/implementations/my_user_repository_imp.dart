import 'package:home/models/my_user.dart';
import 'package:home/providers/firebase_provider.dart';
import 'dart:io';
import 'package:home/repository/my_user_repository.dart';

class MyUserRepositoryImp extends MyUserRepository {
  //instancia de FirebaseProvider
  final provider = FirebaseProvider();

  //funcion para recuperar al uruario del repositorio
  @override
  Future<MyUser?> getMyUser() => provider.getUser();

  //funcion para guardar al usuario al repositorio
  @override
  Future<void> saveMyUser(MyUser user, File? image) =>
      provider.saveUser(user, image);
}
