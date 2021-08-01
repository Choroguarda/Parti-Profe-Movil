import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'datos_persona.dart';

class Registrarse extends StatelessWidget {
  Widget build(BuildContext context) {
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
  User? users = FirebaseAuth.instance.currentUser;

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
                Text('Registrate!!' + (users == null ? 'out' : 'in'),
                    style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 60.0),
                _crearEmail(),
                SizedBox(height: 30.0),
                _crearPassword(),
                SizedBox(height: 30.0),
                _botonIngresar(context),
                SizedBox(height: 30.0),
                _salirprueba(),
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

Widget _crearEmail() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: TextField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
          hintText: 'ejemplo@correo.com',
          labelText: 'Correo Electronico',
        )),
  );
}

Widget _crearPassword() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: TextField(
        controller: _password,
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(Icons.lock, color: Colors.deepPurple),
            labelText: 'Contraseña')),
  );
}

Widget _botonIngresar(BuildContext context) {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  return ElevatedButton(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
      color: Colors.blueAccent,
      child: Text('Crear'),
    ),
    style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.deepPurple)))),
    onPressed: () async {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text, password: _password.text);
      _email.clear();
      _password.clear();

      Navigator.pushNamed(context, 'eleccion');
    },
  );
}

Widget _salirprueba() {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  return ElevatedButton(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
      color: Colors.blueAccent,
      child: Text('Salir'),
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
