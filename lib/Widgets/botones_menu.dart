import 'package:flutter/material.dart';

class BotonesMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(children: [
      TableRow(children: [
        Botones(
          color: Colors.white,
          icon: Icons.book,
          text: 'Mis cursos',
          ruta: 'llamada',
        ),
        Botones(
          color: Colors.white,
          icon: Icons.person,
          text: 'Mis Alumnos',
          ruta: 'llamada',
        ),
      ]),
      TableRow(children: [
        Botones(
          color: Colors.white,
          icon: Icons.announcement,
          text: 'Ver avisos',
          ruta: 'llamada',
        ),
        Botones(
          color: Colors.white,
          icon: Icons.monetization_on,
          text: 'Dinero',
          ruta: 'llamada',
        ),
      ]),
      TableRow(children: [
        Botones(
          color: Colors.white,
          icon: Icons.alarm,
          text: 'Clases',
          ruta: 'llamada',
        ),
        Botones(
          color: Colors.white,
          icon: Icons.notifications,
          text: 'Notificaciones',
          ruta: 'llamada',
        ),
      ]),
    ]);
  }
}

class Botones extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final String ruta;

  const Botones(
      {Key? key,
      required this.icon,
      required this.color,
      required this.text,
      required this.ruta})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        height: 180,
        decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20)),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, ruta),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: this.color,
                child: Icon(this.icon, size: 50),
                radius: 30,
              ),
              Text(this.text, style: TextStyle(color: this.color, fontSize: 18))
            ],
          ),
        ));
  }
}
