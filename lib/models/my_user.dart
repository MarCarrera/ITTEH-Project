import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String id;
  final String name;
  final String lastName;
  final int nControl;
  final int semester;
  final int age;
  final String career;
  final String aboutMe;
  //final String email;
  //final String password;
  final String? image;

  //-----------CONSTRUCTOR DE LA CLASE-----------------------------------------//
  const MyUser(this.id, this.name, this.lastName, this.nControl, this.career,
      this.semester, this.age, this.aboutMe, //this.email, this.password,
      {this.image});

  //Funcion que pasa al objeto StudentModel a un mapa y asi guardarlo en la Database
  //recibe una imagen y devuelve un mapa de String y x Objeto
  Map<String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?>{
      'id': id,
      'name': name,
      'lastName': lastName,
      'nControl': nControl,
      'career': career,
      'semester': semester,
      'age': age,
      'aboutMe': aboutMe,
      //'password': password,
      //guardar la imagen nueva o la ya existente
      'image': newImage ?? image,
    };
  }

  //Funcion que guarda a Objeto (Student) cuando recibe un mapa de la Database
  //si 'data' recibe tal cadena, la convierte a tal tipo de dato y lo almacena
  //en tal variable.
  MyUser.fromFirebaseMap(Map<String, Object?> data)
      : id = data['id'] as String,
        name = data['name'] as String,
        lastName = data['lastName'] as String,
        nControl = data['nControl'] as int,
        semester = data['semester'] as int,
        age = data['age'] as int,
        career = data['career'] as String,
        aboutMe = data['aboutMe'] as String,
        //email = data['email'] as String,
        //password = data['password'] as String,
        image = data['image'] as String?;

  @override
  //Equatable: comparar los objetos que esten actualizados y los que no
  List<Object?> get props => [
        id,
        name,
        lastName,
        nControl,
        semester,
        age,
        career,
        aboutMe,
        //email,
        //password,
        image
      ];
}
