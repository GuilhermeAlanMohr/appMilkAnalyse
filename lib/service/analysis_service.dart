import 'dart:convert';

import 'package:appmilkanalyse/model/analysis.dart';
import 'package:appmilkanalyse/model/user.dart';
import 'package:appmilkanalyse/service/abstract_service.dart';
import 'package:http/http.dart' as http;

class AnalysisService extends AbstractService{

  Future<Analysis> getAnalysis() async {

    final response = await http
        .get(Uri.parse(API_REST+'/albums/1'),headers: headers);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Analysis.fromMap(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

  }

  Future<User> getUsers() async {

    final response = await http
        .get(Uri.parse(API_REST+'/usuario/usuario'),headers: headers);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return User.fromMap(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

  }

}