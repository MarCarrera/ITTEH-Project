//clase del repositorio
import 'dart:io';
import 'package:home/models/my_user.dart';

abstract class MyUserRepository {
  //funcion para guardar al usuario
  Future<MyUser?> getMyUser();

  Future<void> saveMyUser(MyUser user, File? image);
  
}
