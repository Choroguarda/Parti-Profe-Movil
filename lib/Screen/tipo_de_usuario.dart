import 'package:flutter/material.dart';
import 'package:parti_profe/Screen/registrarse.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parti_profe/Widgets/eleccion.dart';

class tipousuario extends StatelessWidget {
  @override
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
                Text('Ingrese sus credenciales',
                    style: TextStyle(fontSize: 20.0)),
                Eleccion(),
              ],
            )),
        Text('¿Ovido la contraseña?'),
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
              'Bienvenido a Parti-Profe',
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            )
          ],
        ),
      )
    ],
  );
}
