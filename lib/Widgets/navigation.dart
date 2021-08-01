import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF0277BD),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        // Respond to item press.
      },
      items: [
        BottomNavigationBarItem(
          title: Text('Menu'),
          icon: Icon(Icons.menu),
        ),
        BottomNavigationBarItem(
          title: Text('Chat'),
          icon: Icon(Icons.chat_sharp),
        ),
        BottomNavigationBarItem(
          title: Text('Cuenta'),
          icon: Icon(Icons.people_alt),
        ),
      ],
    );
  }
}
