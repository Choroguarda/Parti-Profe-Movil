import 'package:flutter/material.dart';
import 'package:parti_profe/Screen/datos_persona.dart';
import 'package:parti_profe/Screen/login.dart';
import 'Screen/perfil_persona.dart';
import 'Screen/home_screen.dart';
import 'pages/index.dart';
import 'Screen/registrarse.dart';
import 'Screen/datos_persona.dart';
import 'package:firebase_core/firebase_core.dart';
import 'fire/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        'diseño_basico': (_) => DisenoMenu(),
        'home_screen': (_) => HomeScreen(),
        'login': (BuildContext context) => Login(),
        'llamada': (_) => IndexPage(),
        'registro': (BuildContext context) => Registrarse(),
        'datospersonales': (BuildContext context) => Datos_Personales(),
      },
    );
  }
}
