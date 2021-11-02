// ignore_for_file: unnecessary_new, avoid_unnecessary_containers, must_be_immutable, avoid_print, prefer_const_constructors, prefer_void_to_null, sized_box_for_whitespace

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../constans.dart';
import 'home_page.dart';


class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  int _lastItem = 0;
  List<int> images = [];

  //propiedades para detectar cuando el usuario este al final de la lista

  final ScrollController _controller = new ScrollController();
  var _final = false;

  _listener() {
    final maxScroll = _controller.position.maxScrollExtent;
    final minScroll = _controller.position.minScrollExtent;

    //asi sabemos que el usuario esta al final de la lista
    if (_controller.offset >= maxScroll) {
      setState(() {
        _final = true;
      });
    }
    if (_controller.offset <= minScroll) {
      setState(() {
        _final = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  //se carga antes de que aparezcan todos los elementos
  @override
  void initState() {
    super.initState();
    _controller.addListener(_listener);
    _agregarElementos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
        appBar: AppBar(
        elevation: 0,
        title: const Text('Galería ITTEH'),
        backgroundColor: Colors.white,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color:  kDefaultColorRed,
          fontSize: 20.0,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: kDefaultColorRed,
          onPressed: () {
            // esto se utilizara para navegar a la pagina principal
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => const HomePage()));
          }, 
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: _galeria(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_circle_outline_sharp),
        backgroundColor: _final ? kDefaultColorRed : Colors.grey.shade200,
        onPressed: () {
          _agregarElementos();
          setState(() {});
        },
      ),
    );
  }

  Widget _galeria() {
    return RefreshIndicator(
      onRefresh: obtenerNuevasImagenes,
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        //los items que se muestran dependen del tamaño del arreglo
        itemCount: images.length,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              /*Navigator.push(context, MaterialPageRoute(
                builder: (context) => const DetailImage()));*/
              //Navigator.pushNamed(context, string); navegar entre rutas : Firebase
            },
            child: Hero(
              tag: images[index],
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Container(
                    height: index.isEven ? 200 : 240,
                    child: FadeInImage(
                      placeholder:
                          const AssetImage('assets/images/loading.gif'),
                      //carga de imagenes desde URL
                      image: NetworkImage(
                          'https://picsum.photos/500/300/?image=${images[index]}'),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
        //espaciado en eje y y x
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 12.0,
      ),
    );
  }

  Future<Null> obtenerNuevasImagenes() {
    final duracion = new Duration(seconds: 2);
    new Timer(duracion, () {
      images.clear();
      _lastItem++;
      _agregarElementos();
    });
    return Future.delayed(duracion);
  }

  void _agregarElementos() {
    for (var i = 0; i < 21; i++) {
      _lastItem++;

      images.add(_lastItem);

      setState(() {});
    }
  }
}
