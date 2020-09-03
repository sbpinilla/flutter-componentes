import 'dart:math';

import 'package:flutter/material.dart';

class ContenedorAnimadoPage extends StatefulWidget {
  @override
  createState() => ContenedorAnimadoPageState();
}

class ContenedorAnimadoPageState extends State<ContenedorAnimadoPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.blue;
  BorderRadiusGeometry _br = BorderRadius.circular(20.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contenedor Animado'),
        ),
        body: Center(
          child: AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            duration: Duration(seconds: 1),
            width: _width,
            height: _height,
            decoration: BoxDecoration(borderRadius: _br, color: _color),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: _cambiarForma,
        ),
      ),
    );
  }

  void _cambiarForma() {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    });
    _br = BorderRadius.circular(random.nextInt(30).toDouble());
  }
}
