import 'dart:convert';

import 'package:appmilkanalyse/model/analysis.dart';
import 'package:appmilkanalyse/model/user.dart';
import 'package:appmilkanalyse/service/abstract_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AnalysisService extends AbstractService{

  Future<Analysis> getAnalise() async {

    final response = await client?.get(Uri.parse(API_REST+'/analise/analise'),headers: headers);

    if (response!.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Analysis.fromMap(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

  }

  Future<List<Analysis>> getAnalises() async {

    final response = await client?.get(Uri.parse(API_REST+'/analise/analises'),headers: headers);

    if (response!.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      return jsonResponse.map<Analysis>( (json)=> Analysis.fromMap(json) ).toList();

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

  }

  Future<int> cadastrar(Analysis analysis) async {

    final conteudo = json.encode(analysis.toMap());
    debugPrint(conteudo);
    final resposta = await client?.post(Uri.parse(API_REST+"/analise/cadastrar"),
        headers: super.headers, body: conteudo, encoding: null);
    debugPrint(resposta!.statusCode.toString());
    return resposta.statusCode;

  }

}