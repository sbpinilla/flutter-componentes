import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = ScrollController();
  List<int> _listaNumeros = List();
  int _ultimoItem = 0;
  bool _estaCargando = false;

  @override
  void initState() {
    super.initState();

    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _traerInformacion();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(children: [_crearLista(), _crearLoading()]),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _traerInformacion2,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (context, index) {
          final imagen = _listaNumeros[index];

          return FadeInImage(
              fit: BoxFit.cover,
              width: 500,
              height: 300,
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/id/$imagen/500/300'));
        },
      ),
    );
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;

      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future _traerInformacion() async {
    _estaCargando = true;

    setState(() {});

    final duracion = Duration(seconds: 2);
    return Timer(duracion, respuestaHttp);
  }

  Future _traerInformacion2() async {
    final duracion = Duration(seconds: 2);
    Timer(duracion, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duracion);
  }

  void respuestaHttp() {
    _estaCargando = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(microseconds: 200), curve: Curves.bounceIn);
    _agregar10();
  }

  Widget _crearLoading() {
    if (_estaCargando) {
      final loader = Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      );

      return loader;
    } else {
      return Container();
    }
  }
}
