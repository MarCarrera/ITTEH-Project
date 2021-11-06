// ignore_for_file: deprecated_member_use, unused_element, non_constant_identifier_names

import 'package:flutter/material.dart';
import '../constans.dart';
import 'body.dart';
import 'nav_bar_pages/calendar_page.dart';
import 'nav_bar_pages/chat_page.dart';
import 'nav_bar_pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //item del navbar inicial
  int selectedItem = 0;
  //arreglo de paginas para navegar
  final List<Widget> _pages = [
    const Body(),
    const CalendarPage(),
    const ChatPage(),
    const ProfilePage(),
    /*"/body"
    "/calendar"
    "/chat"
    "/profile"*/
  ];
  //evaluar la navegacion a la paginas
  void _onTappedBar(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //body: const LoginPage(),
        body: _pages[selectedItem],
        bottomNavigationBar: BottomNavigationBar(
            onTap: _onTappedBar,
            //meter efecto de circulo selecionado
            currentIndex: selectedItem,
            //colores del navigatorbar
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white54,

            //comienzan los items del navigator
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Inicio'),
                backgroundColor: kDefaultColorBlue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                title: Text('Calendario'),
                backgroundColor: kDefaultColorBlue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                title: Text('Chat'),
                backgroundColor: kDefaultColorBlue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Perfil'),
                backgroundColor: kDefaultColorBlue,
              ),
            ]));
  }
}
