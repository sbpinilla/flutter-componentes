import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _seleccionar = 'uno';
  TextEditingController _inputFecha = TextEditingController();
  List<String> _poderes = ['uno', 'dos', 'tres', 'cuatro', 'cinco', 'seis'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campos de texto'),
      ),
      body: ListView(
          padding: EdgeInsets.only(right: 10.0, left: 10, top: 20),
          children: [
            _crearInput1(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearClave(),
            Divider(),
            _crearFecha(context),
            Divider(),
            _crearListaDesplegable(),
            Divider(),
            _crearPersona(),
          ]),
    );
  }

  Widget _crearInput1() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (value) {
        setState(() {
          _nombre = value;
          print(_nombre);
        });
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        counter: Text('Cantidad de letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Mi nombre es $_nombre'),
      subtitle: Text(_email),
      trailing: Text(_seleccionar),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          _email = value;
          print(_nombre);
        });
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
    );
  }

  Widget _crearClave() {
    return TextField(
      obscureText: true,
      onChanged: (value) {
        setState(() {
          _email = value;
          print(_nombre);
        });
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        hintText: 'Clave',
        labelText: 'Clave',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFecha,
      enableInteractiveSelection: false,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        hintText: 'Fecha Nacimiento',
        labelText: 'Fecha Nacimiento',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.calendar_today),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime fecha = await showDatePicker(
        locale: Locale('es', 'ES'),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025));

    if (fecha != null) {
      setState(() {
        _fecha = fecha.toString();
        _inputFecha.text = _fecha;
      });
    }
  }

  Widget _crearListaDesplegable() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
            value: _seleccionar,
            items: _crearItemsListaDesplegable(),
            onChanged: (value) {
              setState(() {
                _seleccionar = value;
                print(value);
              });
            },
          ),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> _crearItemsListaDesplegable() {
    List<DropdownMenuItem<String>> list = List<DropdownMenuItem<String>>();

    _poderes.forEach((element) {
      final item = DropdownMenuItem<String>(
        child: Text(element),
        value: element,
      );
      list.add(item);
    });

    return list;
  }
}
