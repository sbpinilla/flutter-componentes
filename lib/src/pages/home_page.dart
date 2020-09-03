import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  BuildContext gContext;

  @override
  Widget build(BuildContext context) {
    gContext = context;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    /*
    menuProvider.cargarData().then((opciones) {
      print('_lista');
      print(opciones);
    });*/

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        print(snapshot.data);

        return ListView(
          children: _crearListaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _crearListaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((element) {
      final widgetTem = ListTile(
        title: Text(element['texto']),
        leading: getIcono(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          /*
          final alertPage =
              MaterialPageRoute(builder: (context) => AlertPage());

          Navigator.push(context, alertPage);*/

          Navigator.pushNamed(context, element['ruta']);
        },
      );

      opciones..add(widgetTem)..add(Divider());
    });

    return opciones;
  }
}
