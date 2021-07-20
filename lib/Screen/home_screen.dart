import 'package:flutter/material.dart';
import 'package:parti_profe/Widgets/background.dart';
import 'package:parti_profe/Widgets/botones_menu.dart';
import 'package:parti_profe/Widgets/navigation.dart';
import 'package:parti_profe/Widgets/page_title.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Background(), _HomeBody()],
      ),
      bottomNavigationBar: Navigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        //TITULOS
        PageTittle(),

        //tabla de botones
        BotonesMenu()
      ],
    ));
  }
}
