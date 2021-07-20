import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      backgroundColor: Color.fromRGBO(250, 250, 500, 25),
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.accessibility), label: 'Mi cuenta'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chat'),
      ],
    );
  }
}
