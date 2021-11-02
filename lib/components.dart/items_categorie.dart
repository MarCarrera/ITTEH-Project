import 'package:flutter/material.dart';
import '../constans.dart';

class ItemsCategorie extends StatelessWidget {
  final Color color;
  final String image;
  final Widget page;
  //final String text;
  final double alto;
  final double ancho;

  const ItemsCategorie({
    Key? key,
    required this.color,
    required this.alto,
    required this.ancho,
    required this.image,
    required this.page,
    // required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
          margin: const EdgeInsets.all(kDefaultPaddin * 0.3),
          padding: const EdgeInsets.all(14),
          height: alto,
          width: ancho,
          child: Image.asset(
            image,
            alignment: Alignment.topLeft,
          ),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: kDefaultColorGrey,
                  blurRadius: 8,
                  offset: Offset(4, 8),
                )
              ])),
    );
  }
}
