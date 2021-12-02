// ignore_for_file: deprecated_member_use, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/controllers/auth_controller.dart';
import 'package:home/controllers/my_user_controller.dart';
import 'package:image_picker/image_picker.dart';
import '../../constans.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(MyUserController());

    return Scaffold(body: Obx(() {
      if (userController.isLoading.value) {
        return const Center(
            child: CircularProgressIndicator(
          color: kDefaultColorBlue,
          strokeWidth: 3.7,
        ));
      }
      return const MyUserSection(
        name: '',
        nControl: '',
        dateAdm: '',
        semester: '',
        career: '',
        email: '',
        phone: '',
        date: '',
        place: '',
        description: '',
      );
    }));
  }
}

class MyUserSection extends StatefulWidget {
  final String name;
  final String nControl;
  final String dateAdm;
  final String semester;
  final String career;
  final String email;
  final String phone;
  final String date;
  final String place;
  final String description;
  const MyUserSection({
    Key? key,
    required this.name,
    required this.nControl,
    required this.dateAdm,
    required this.semester,
    required this.career,
    required this.email,
    required this.phone,
    required this.date,
    required this.place,
    required this.description,
  }) : super(key: key);

  @override
  State<MyUserSection> createState() => MyUserSectionState();
}

class MyUserSectionState extends State<MyUserSection> {
  final picker = ImagePicker();

  //inicializar DatePicker
  var _currentSelectedDate = DateTime.now();
  //llamar al DatePicker
  void callDatePicker() async {
    var selectedDate = await getDatePickerWidget();
    setState(() {
      _currentSelectedDate = selectedDate!;
    });
  }

  //crear Widget DataPicker, logica principal donde se inicializa
  Future<DateTime?> getDatePickerWidget() {
    return showDatePicker(
      context: context,
      initialDate: _currentSelectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final userController = Get.find<MyUserController>();

    /*final imageObx = Obx(() {
      Widget image = Icon(
        Icons.person,
        color: Colors.grey.shade300,
        size: 80.0,
      );
      if (userController.pickedImage.value != null) {
        image = Image.file(
          userController.pickedImage.value!,
          fit: BoxFit.fill,
        );
      } else if (userController.user.value?.image?.isNotEmpty == true) {
        image = CachedNetworkImage(
          imageUrl: userController.user.value!.image!,
          progressIndicatorBuilder: (_, __, progress) =>
              CircularProgressIndicator(
                  value: progress.progress,
                  color: kDefaultColorBlue,
                  strokeWidth: 3.5),
          errorWidget: (_, __, ___) => const Icon(Icons.error),
          fit: BoxFit.fill,
        );
      }
      return image;
    });*/

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            // esta linea agrega el boton con icono para regresar y se agrega color
            leading: IconButton(
              onPressed: () {
                Get.toNamed('/home');
              },
              icon: const Icon(Icons.arrow_back_ios_new),
              color: kDefaultColorBlue,
            ),
            actions: <Widget>[
              IconButton(
                //icon: Image.asset('assets/images/icon_setting.png',
                icon: const Icon(Icons.notifications, color: kDefaultColorBlue),
                onPressed: () {},
              ),
            ]),
        //SystemNavigator.pop(); //salir
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: Colors.white,
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    //GestureDetector(
                    /* onTap: () async {
                        final pickedImage =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (pickedImage != null) {
                          Get.find<MyUserController>()
                              .setImage(File(pickedImage.path));
                        }
                      },*/

                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 8,
                            right: 16,
                          ),
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
                          child: const Icon(Icons.person),
                        ),
                      ],
                    ),
                    //),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      if (Get.find<AuthController>().authState.value ==
                          AuthState.signedIn) {
                        return GestureDetector(
                          onTap: () {
                            editName(context);
                          },
                          child: Center(
                            child: Text(
                              widget.name.isEmpty
                                  ? 'Student name'
                                  : widget.name,
                              style: const TextStyle(fontSize: 19),
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 8.0, bottom: 4.0),
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "User Information",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed('/editProfile');
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 185.0, bottom: 4.0),
                                  alignment: Alignment.topLeft,
                                  child: const Icon(Icons.edit,
                                      color: kDefaultColorGrey),
                                ),
                              ),
                            ],
                          ),
                          Card(
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: 140,
                                        child: ListTile(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12),
                                          //leading: Icon(Icons.code),
                                          title: const Text("Matricula"),
                                          subtitle: Text(widget.nControl),
                                        ),
                                      ),
                                      Container(
                                        width: 140,
                                        child: ListTile(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12),
                                          //leading: Icon(Icons.star),
                                          title:
                                              const Text("Fecha de Admisión"),
                                          subtitle: Text(widget.dateAdm),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      _lineGrey(),
                                      const SizedBox(width: 10),
                                      _lineGrey(),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: 140,
                                        child: ListTile(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12),
                                          //leading: Icon(Icons.code),
                                          title: const Text("Semestre"),
                                          subtitle: Text("${widget.semester}º"),
                                        ),
                                      ),
                                      Container(
                                        width: 140,
                                        child: ListTile(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12),
                                          //leading: Icon(Icons.star),
                                          title: const Text("Carrera en curso"),
                                          subtitle: Text(widget.career),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      _lineGrey(),
                                      const SizedBox(width: 10),
                                      _lineGrey(),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Column(
                                    children: <Widget>[
                                      ...ListTile.divideTiles(
                                        color: Colors.grey,
                                        tiles: [
                                          /*ListTile(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 4),
                                              leading: const Icon(Icons.email),
                                              title: const Text(
                                                  "Correo electrónico"),
                                              subtitle: Text(widget.email),
                                              trailing: IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () {
                                                  editEmail(context);
                                                },
                                              )),*/

                                          ListTile(
                                            leading: const Icon(Icons.phone),
                                            title: const Text("Teléfono"),
                                            subtitle:
                                                Text('+(52) ${widget.phone}'),
                                          ),
                                          ListTile(
                                              leading: const Icon(
                                                  Icons.calendar_today),
                                              title: const Text(
                                                  "Fecha de nacimiento"),
                                              //subtitle: Text(widget.place),
                                              subtitle: Text(
                                                  '${_currentSelectedDate.day}/${_currentSelectedDate.month}/${_currentSelectedDate.year}'),
                                              trailing: IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: callDatePicker,
                                              )),
                                          ListTile(
                                            leading:
                                                const Icon(Icons.my_location),
                                            title:
                                                const Text("Lugar de origen"),
                                            subtitle: Text(widget.place),
                                          ),
                                          ListTile(
                                            leading: const Icon(Icons.person),
                                            title: const Text("Acerca de mi"),
                                            subtitle: Text(widget.description),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  _lineGrey() {
    return Container(
      height: 0.8,
      width: 135.0,
      color: Colors.grey,
      //margin: const EdgeInsets.only(left: 15.0, top: 22.0),
    );
  }

  Future<dynamic> editName(BuildContext context) {
    TextEditingController _nameController =
        TextEditingController(text: widget.name);

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Nombre y apellido'),
              content: TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text),
              actions: [
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      if (_nameController.text.isNotEmpty) {
                        Get.toNamed('/userSection');
                        /*Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => _MyUserSection(
                                  name: _nameController.text,
                                  nControl: '',
                                  dateAdm: '',
                                  semester: '',
                                  career: '',
                                  email: '',
                                  phone: '',
                                  date: '',
                                  place: '',
                                  description: '',
                                ))
                              );*/
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Inválido"),
                            content: const Text(
                                "Es necesario que registre un nombre y apellido real."),
                            actions: <Widget>[
                              FlatButton(
                                child: const Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ));
  }

  Future<dynamic> editNControl(BuildContext context) {
    TextEditingController _nContController =
        TextEditingController(text: widget.nControl);

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Matricula'),
              content: TextFormField(
                  controller: _nContController,
                  keyboardType: TextInputType.number),
              actions: [
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      if (_nContController.text.trim().length == 8) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyUserSection(
                                  name: '',
                                  nControl: _nContController.text,
                                  dateAdm: '',
                                  semester: '',
                                  career: '',
                                  email: '',
                                  phone: '',
                                  date: '',
                                  place: '',
                                  description: '',
                                )));
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Inválido"),
                            content:
                                const Text("Registre una matricula válida"),
                            actions: <Widget>[
                              FlatButton(
                                child: const Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ));
  }

  Future<dynamic> editSemester(BuildContext context) {
    TextEditingController _semesterController =
        TextEditingController(text: widget.semester);

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Semestre'),
              content: TextFormField(
                  controller: _semesterController,
                  keyboardType: TextInputType.number),
              actions: [
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      if (_semesterController.text.isNotEmpty &&
                          _semesterController.text.trim().length <= 2) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyUserSection(
                                  name: '',
                                  nControl: '',
                                  dateAdm: '',
                                  semester: _semesterController.text,
                                  career: '',
                                  email: '',
                                  phone: '',
                                  date: '',
                                  place: '',
                                  description: '',
                                )));
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Inválido"),
                            content: const Text(
                                "Registre uno o dos digitos numéricos de acuerdo al semestre en curso actual."),
                            actions: <Widget>[
                              FlatButton(
                                child: const Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ));
  }

  Future<dynamic> editCareer(BuildContext context) {
    TextEditingController _careerController =
        TextEditingController(text: widget.career);

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Carrera en curso'),
              content: TextFormField(
                  controller: _careerController,
                  keyboardType: TextInputType.text),
              actions: [
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      if (_careerController.text.isNotEmpty) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyUserSection(
                                  name: '',
                                  nControl: '',
                                  dateAdm: '',
                                  semester: '',
                                  career: _careerController.text,
                                  email: '',
                                  phone: '',
                                  date: '',
                                  place: '',
                                  description: '',
                                )));
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Inválido"),
                            content:
                                const Text("Registre su carrera en curso."),
                            actions: <Widget>[
                              FlatButton(
                                child: const Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ));
  }

  Future<dynamic> editEmail(BuildContext context) {
    TextEditingController _emailController =
        TextEditingController(text: widget.email);

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Semestre'),
              content: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.number),
              actions: [
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      if (_emailController.text.isNotEmpty) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyUserSection(
                                  name: '',
                                  nControl: '',
                                  dateAdm: '',
                                  semester: '',
                                  career: '',
                                  email: _emailController.text,
                                  phone: '',
                                  date: '',
                                  place: '',
                                  description: '',
                                )));
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Inválido"),
                            content: const Text(
                                "Registre el email con el que se registro."),
                            actions: <Widget>[
                              FlatButton(
                                child: const Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ));
  }

  Future<dynamic> editPhone(BuildContext context) {
    TextEditingController _phoneController =
        TextEditingController(text: widget.phone);

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Actualizar teléfono'),
              content: TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone),
              actions: [
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      if (_phoneController.text.trim().length == 10) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyUserSection(
                                  name: '',
                                  nControl: '',
                                  dateAdm: '',
                                  semester: '',
                                  career: '',
                                  email: '',
                                  phone: _phoneController.text,
                                  date: '',
                                  place: '',
                                  description: '',
                                )));
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Inválido"),
                            content: const Text(
                                "Registre un número de teléfono válido y sin espacios."),
                            actions: <Widget>[
                              FlatButton(
                                child: const Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ));
  }

  Future<dynamic> editPlace(BuildContext context) {
    TextEditingController _placeController =
        TextEditingController(text: widget.place);

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Lugar de origen'),
              content: TextFormField(
                controller: _placeController,
                keyboardType: TextInputType.text,
              ),
              actions: [
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyUserSection(
                        name: '',
                        nControl: '',
                        dateAdm: '',
                        semester: '',
                        career: '',
                        email: '',
                        phone: '',
                        date: '',
                        place: _placeController.text,
                        description: '',
                      ),
                    ));
                  },
                ),
              ],
            ));
  }

  Future<dynamic> editDescription(BuildContext context) {
    TextEditingController _descriController =
        TextEditingController(text: widget.description);

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Acerca de mi...'),
              content: TextFormField(
                controller: _descriController,
                keyboardType: TextInputType.multiline,
              ),
              actions: [
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyUserSection(
                        name: '',
                        nControl: '',
                        dateAdm: '',
                        semester: '',
                        career: '',
                        email: '',
                        phone: '',
                        date: '',
                        place: '',
                        description: _descriController.text,
                      ),
                    ));
                    //Navigator.of(context).pop(_phoneController.text);
                    //_phoneController.text);
                  },
                ),
              ],
            ));
  }
}
