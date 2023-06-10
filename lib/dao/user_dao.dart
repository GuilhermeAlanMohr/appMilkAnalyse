import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'openDB.dart';
import '../model/user.dart';

class UserDAO{

  adicionarUser(User u) async{

    final Database db = await getDatabase();
    db.insert('USER', u.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);

  }

  Future<List<User>> getUsers() async {

    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('USER');

    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }

}