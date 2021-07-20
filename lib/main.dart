import 'package:flutter/material.dart';
import 'package:parti_profe/Screen/login.dart';
import 'Screen/perfil_persona.dart';
import 'Screen/home_screen.dart';
import 'pages/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'llamada',
      routes: {
        'diseño_basico': (_) => DisenoMenu(),
        'home_screen': (_) => HomeScreen(),
        'login': (BuildContext context) => Login(),
        'llamada': (_) => IndexPage(),
      },
    );
  }
}
