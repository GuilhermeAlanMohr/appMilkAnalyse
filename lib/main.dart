import 'package:appmilkanalyse/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      home: Login(),
    )
  );
}