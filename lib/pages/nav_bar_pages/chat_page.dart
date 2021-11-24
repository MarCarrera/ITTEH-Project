import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/controllers/auth_controller.dart';

import '../../constans.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool isSearching = false;
  final authController = Get.put(AuthController());
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: authController,
        builder: (_) {
          return Scaffold(
            body: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 46),
              color: Colors.transparent,
              child: const Text(
                'Chats',
                style: TextStyle(
                  color: kDefaultColorBlue,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    isSearching = false;
                    userNameController.text = '';
                    setState(() {});
                  },
                  child: isSearching
                      ? const Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            bottom: 22,
                          ),
                          child:
                              Icon(Icons.arrow_back, color: kDefaultColorBlue))
                      : Container(),
                ),
                Expanded(
                  child: Container(
                    width: 262.0,
                    height: 50.0,
                    margin: const EdgeInsets.only(
                        right: 15.0, bottom: 24.0, left: kDefaultPaddin),
                    padding: const EdgeInsets.only(left: kDefaultPaddin),
                    decoration: BoxDecoration(
                        color: cSearchBar,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Opacity(
                      opacity: 0.3,
                      child: TextField(
                        controller: userNameController,
                        decoration: const InputDecoration(
                          hintText: "Username",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          //suffixIcon: Icon(Icons.search)
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      isSearching = true;
                      setState(() {});
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 15, bottom: 20),
                      child: Icon(Icons.search, color: kDefaultColorBlue),
                    )),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              alignment: Alignment.center,
              child: Text(Get.find<AuthController>().authUser.value?.uid ?? ''),
            )
          ]));
        });
  }
}

Row searchBar(bool isSearching) {
  return Row(
    children: [
      GestureDetector(
        onTap: () {
          //isSearching = false;
        },
        child: isSearching
            ? const Padding(
                padding: EdgeInsets.only(
                  right: 10,
                  bottom: 20,
                ),
                child: Icon(Icons.arrow_back, color: kDefaultColorBlue))
            : Container(),
      ),
      Expanded(
        child: Container(
          width: 262.0,
          height: 50.0,
          margin: const EdgeInsets.only(
              right: 15.0, bottom: 24.0, left: kDefaultPaddin),
          padding: const EdgeInsets.only(left: kDefaultPaddin),
          decoration: BoxDecoration(
              color: cSearchBar, borderRadius: BorderRadius.circular(15.0)),
          child: const Opacity(
            opacity: 0.3,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Username",
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                //suffixIcon: Icon(Icons.search)
              ),
            ),
          ),
        ),
      ),
      GestureDetector(
          onTap: () {
            isSearching = true;
            //setState(() {});
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 15, bottom: 20),
            child: Icon(
              Icons.search,
            ),
          )),
    ],
  );
}
