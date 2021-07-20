import 'package:flutter/material.dart';

class DisenoMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image(image: AssetImage('assets/predeterminado.jpg')),
        Tittle(),

        //Seccion de  boton
        ButtonSection(),

        //Seccion de descriopcion

        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Text(
              'mequieromorirrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr'),
        )
      ],
    ));
  }
}

class Tittle extends StatelessWidget {
  const Tittle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'aca va el nombre',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                'ocupacion',
                style: TextStyle(color: Colors.black54, fontSize: 20),
              ),
            ],
          ),
          Expanded(child: Container()),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Text(' 5')
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButton(
            icon: Icons.chat_sharp,
            texto: 'Chat',
          ),
          CustomButton(icon: Icons.share_sharp, texto: 'Compartir'),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String texto;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          this.icon,
          color: Colors.blueAccent,
          size: 35,
        ),
        Text(this.texto, style: TextStyle(color: Colors.black))
      ],
    );
  }
}
