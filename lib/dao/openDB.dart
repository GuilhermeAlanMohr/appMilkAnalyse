import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

Future<Database> getDatabase() async{

  final String path = join(await getDatabasesPath(), 'db');

  return openDatabase(
    path,
    onCreate: (db, version){
      db.execute('CREATE TABLE USER (codUser INTEGER PRIMARY KEY, nomeUser TEXT, email TEXT, token TEXT, senha TEXT NULL, permissao TEXT)');
    },
    version: 1,
  );

}