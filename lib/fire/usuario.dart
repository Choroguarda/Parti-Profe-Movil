import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreApp extends StatefulWidget {
  const FireStoreApp({Key? key}) : super(key: key);

  @override
  _FireStoreAppState createState() => _FireStoreAppState();
}

class _FireStoreAppState extends State<FireStoreApp> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection('user');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textController,
          ),
        ),
        body: Center(
          child: StreamBuilder(
              stream: user.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return ListView(
                  children: snapshot.data!.docs.map((user) {
                    return Center(
                      child: ListTile(
                        title: Text(user['email']),
                        onLongPress: () {
                          user.reference.delete();
                        },
                      ),
                    );
                  }).toList(),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            user.add({
              'email': textController.text,
            });
            textController.clear();
          },
        ),
      ),
    );
  }
}
//SI VEO UNA PANTALLA ROJA QUE PASA DURANTE UN MEDIO SEGUNDO, ES POR UN PROBLEMA QUE PUEDO SOLUCIONAR EN EL VIDEO
//EN EL MINUTO 16 HACIA DELANTE. FALTA SOLO
