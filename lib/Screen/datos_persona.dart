import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Datos_Personales extends StatelessWidget {
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      print(currentUser.uid);
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }
}

TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();

Widget _loginForm(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        SafeArea(
            child: Container(
          height: 180.0,
        )),
        Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0)
              ],
            ),
            child: Column(
              children: <Widget>[
                Text('Ingresa tus datos personales!!',
                    style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 30.0),
                _nombreUsuario(),
                SizedBox(height: 30.0),
                _crearNombre(),
                SizedBox(height: 30.0),
                _crearApellidoPaterno(),
                SizedBox(height: 30.0),
                _crearApellidoMaterno(),
                SizedBox(height: 30.0),
                _edad(),
                SizedBox(height: 30.0),
              ],
            )),
        SizedBox(height: 100.0)
      ],
    ),
  );
}

Widget _crearFondo(BuildContext context) {
  final size = MediaQuery.of(context).size;

  final fondologin = Container(
    height: size.height * 0.40,
    width: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
      Color.fromRGBO(25, 0, 120, 10),
      Color.fromRGBO(25, 0, 100, 10),
    ])),
  );

  final circulo = Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05)),
  );

  return Stack(
    children: <Widget>[
      fondologin,
      Positioned(top: 90.0, left: 30.0, child: circulo),
      Positioned(top: -40.0, left: -30.0, child: circulo),
      Positioned(bottom: -50.0, right: -10.0, child: circulo),
      Positioned(bottom: 120.0, right: 20.0, child: circulo),
      Positioned(bottom: -50.0, left: -20.0, child: circulo),
      Container(
        padding: EdgeInsets.only(top: 80.0),
        child: Column(
          children: <Widget>[
            Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
            SizedBox(height: 10.0, width: double.infinity),
            Text(
              'Registrate en Parti-Profe',
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            )
          ],
        ),
      )
    ],
  );
}

Widget _nombreUsuario() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: TextField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
          hintText: 'CesarMasterProfe',
          labelText: 'Nombre Usuario',
        )),
  );
}

Widget _crearNombre() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: TextField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
          hintText: 'Diego Felipe',
          labelText: 'Nombres o Nombre',
        )),
  );
}

Widget _crearApellidoPaterno() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: TextField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
          hintText: 'Sandoval',
          labelText: 'Primer  Apellido',
        )),
  );
}

Widget _crearApellidoMaterno() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: TextField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
          hintText: 'Rios',
          labelText: 'Segundo Apellido',
        )),
  );
}

Widget _edad() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: TextField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
          hintText: '22',
          labelText: 'Edad',
        )),
  );
}

Widget _datoscompletados() {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  return ElevatedButton(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
      color: Colors.blueAccent,
      child: Text('Presiona aca para continuar'),
    ),
    style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.deepPurple)))),
    onPressed: () async {
      await FirebaseAuth.instance.signOut();
    },
  );
}