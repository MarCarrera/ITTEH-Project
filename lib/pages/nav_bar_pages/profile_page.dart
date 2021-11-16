// ignore_for_file: sized_box_for_whitespace, avoid_print, unnecessary_null_comparison, deprecated_member_use, void_checks

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constans.dart';

class ProfilePage extends StatefulWidget {
  final String phone;
  final String date;
  final String place;
  final String description;
  const ProfilePage({
    Key? key,
    required this.phone,
    required this.date,
    required this.place,
    required this.description,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.white, elevation: 0, actions: <Widget>[
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
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 8,
                          right: 16,
                        ),
                        padding: const EdgeInsets.all(10),
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
                        child: Icon(
                          Icons.person,
                          color: Colors.grey.shade300,
                          size: 80.0,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(80, 90, 0, 0),
                        child: Icon(
                          Icons.add_circle,
                          color: Colors.grey.shade700,
                          size: 32.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Student name',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  //const SizedBox(height: 20,),
                  //const Text('emailuser@gmail.com', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 4.0),
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
                                      child: const ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        //leading: Icon(Icons.code),
                                        title: Text("Matricula"),
                                        subtitle: Text("18260475"),
                                      ),
                                    ),
                                    Container(
                                      width: 140,
                                      child: const ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        //leading: Icon(Icons.star),
                                        title: Text("Fecha de Admisión"),
                                        subtitle: Text("26/08/18"),
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
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 140,
                                      child: const ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        //leading: Icon(Icons.code),
                                        title: Text("Semestre"),
                                        subtitle: Text("6º"),
                                      ),
                                    ),
                                    Container(
                                      width: 140,
                                      child: const ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        //leading: Icon(Icons.star),
                                        title: Text("Carrera en curso"),
                                        subtitle: Text(
                                            "Ing. Sistemas Computacionales"),
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
                                        const ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          leading: Icon(Icons.email),
                                          title: Text("Correo electrónico"),
                                          subtitle:
                                              Text("emailusuario@gmail.com"),
                                        ),
                                        ListTile(
                                            leading: const Icon(Icons.phone),
                                            title: const Text("Teléfono"),
                                            subtitle: Text(widget.phone),
                                            trailing: IconButton(
                                              icon: const Icon(Icons.edit),
                                              onPressed: () {
                                                editPhone(context);
                                              },
                                            )),
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
                                            trailing: IconButton(
                                              onPressed: () {
                                                editPlace(context);
                                              },
                                              icon: const Icon(Icons.edit),
                                            )),
                                        ListTile(
                                            leading: const Icon(Icons.person),
                                            title: const Text("Acerca de mi"),
                                            subtitle: Text(widget.description),
                                            trailing: IconButton(
                                              onPressed: () {
                                                editDescription(context);
                                              },
                                              icon: const Icon(Icons.edit),
                                            )),
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
      ),
    );
  }

  _lineGrey() {
    return Container(
      height: 0.8,
      width: 135.0,
      color: Colors.grey,
      //margin: const EdgeInsets.only(left: 15.0, top: 22.0),
    );
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
                          builder: (context) => ProfilePage(
                            phone: _phoneController.text,
                            date: '',
                            place: '',
                            description: '',
                          ),
                        ));
                      } else {
                        _showMessageDialog(context);
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
                      builder: (context) => ProfilePage(
                        place: _placeController.text,
                        date: '',
                        phone: '',
                        description: '',
                      ),
                    ));
                    //Navigator.of(context).pop(_phoneController.text);
                    //_phoneController.text);
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
                      builder: (context) => ProfilePage(
                        description: _descriController.text,
                        date: '',
                        phone: '',
                        place: '',
                      ),
                    ));
                    //Navigator.of(context).pop(_phoneController.text);
                    //_phoneController.text);
                  },
                ),
              ],
            ));
  }

  _showMessageDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Inválido"),
          content: const Text("Registre un número de teléfono inválido."),
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
