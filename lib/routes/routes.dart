// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:home/pages/body.dart';
import 'package:home/pages/careers_screen.dart';
import 'package:home/pages/form_class_page.dart';
import 'package:home/pages/gallery.dart';
import 'package:home/pages/home_page.dart';
import 'package:home/pages/login_page.dart';
import 'package:home/pages/nav_bar_pages/calendar_page.dart';
import 'package:home/pages/nav_bar_pages/chat_page.dart';
import 'package:home/pages/nav_bar_pages/profile_page.dart';
import 'package:home/pages/personal_screen.dart';
import 'package:home/pages/registration_page.dart';
import 'package:home/pages/screen_notices.dart';

routes() => [
  GetPage(name: "/login", page: () => LoginPage(), transition: Transition.zoom),
  GetPage(name: "/home", page: () => HomePage(), transition: Transition.zoom),
  GetPage(name: "/body", page: () => Body(), transition: Transition.zoom),
  GetPage(name: "/calendar", page: () => CalendarPage(), transition: Transition.zoom),
  GetPage(name: "/chat", page: () => ChatPage(), transition: Transition.zoom),
  GetPage(name: "/profile", page: () => ProfilePage(), transition: Transition.zoom),
  GetPage(name: "/notices", page: () => ScreenNotices(), transition: Transition.zoom),
  GetPage(name: "/personal", page: () => PersonalScreen(), transition: Transition.zoom),
  GetPage(name: "/careers", page: () => CareersScreen(), transition: Transition.zoom),
  GetPage(name: "/gallery", page: () => Gallery(), transition: Transition.zoom),
  GetPage(name: "/form", page: () => FormClassPage(), transition: Transition.zoom),
  GetPage(name: "/registration", page: () => RegistrationPage(), transition: Transition.zoom),
  ];
