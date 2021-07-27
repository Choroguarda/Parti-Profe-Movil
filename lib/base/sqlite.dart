import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SqliteApp());
}

class SqliteApp extends StatefulWidget {
  const SqliteApp({Key? key}) : super(key: key);

  @override
  _SqliteAppState createState() => _SqliteAppState();
}

class _SqliteAppState extends State<SqliteApp> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: TextField(
          controller: textController,
        )),
        body: Center(
          child: FutureBuilder<List<Materia>>(
              future: DatabaseHelper.instance.getMateria(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Materia>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text('Cargando...'));
                }
                return snapshot.data!.isEmpty
                    ? Center(child: Text('no hay ni una wea'))
                    : ListView(
                        children: snapshot.data!.map((materia) {
                          return Center(
                            child: ListTile(
                              title: Text(materia.nombre),
                            ),
                          );
                        }).toList(),
                      );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () async {
            await DatabaseHelper.instance.add(
              Materia(nombre: textController.text),
            );
            setState(() {
              textController.clear();
            });
          },
        ), //FloatingActionButton
      ),
    );
  }
}

class Materia {
  final int? id;
  final String nombre;

  Materia({this.id, required this.nombre});

  factory Materia.fromMap(Map<String, dynamic> json) => new Materia(
        id: json['id'],
        nombre: json['nombre'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'partiprofe.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE materia(
          id INTEGER PRIMARY KEY,
          nombre TEXT,
      )
      ''');
  }

  Future<List<Materia>> getMateria() async {
    Database db = await instance.database;
    var materia = await db.query('materia', orderBy: 'nombre');
    List<Materia> materiaList = materia.isNotEmpty
        ? materia.map((c) => Materia.fromMap(c)).toList()
        : [];
    return materiaList;
  }

  Future<int> add(Materia materia) async {
    Database db = await instance.database;
    return await db.insert('materia', materia.toMap());
  }
}
