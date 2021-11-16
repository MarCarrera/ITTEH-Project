// ignore_for_file: deprecated_member_use, unnecessary_null_comparison, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataTime',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Chat(),
    );
  }
}

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  @override
  Widget build(BuildContext context) {
    //String _phone = '123-4567-789';
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(children: [
            FlatButton(child: const Text('Date'), onPressed: () {}),
          ]),
        ),
      ),
    );
  }
}
