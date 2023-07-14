import 'dart:convert';

import 'package:appmilkanalyse/model/farm.dart';
import 'package:appmilkanalyse/service/abstract_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FarmService extends AbstractService{

  Future<Farm> getFazenda() async {

    final response = await client?.get(Uri.parse(API_REST+'/fazenda/fazenda'),headers: super.headers);

    if (response!.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Farm.fromMap(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

  }

  Future<List<Farm>> getFazendas() async {

    final response = await client?.get(Uri.parse(API_REST+'/fazenda/fazendas'),headers: super.headers);
    print("STATUS DO LIST-FARMS"+response!.statusCode.toString());

    if (response!.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print('RECEBEU A LISTA DE FAZENDAS');
      var jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      return jsonResponse.map<Farm>( (json)=> Farm.fromMap(json) ).toList();

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

  }

  Future<int> cadastrar(Farm farm) async {

    final conteudo = json.encode(farm.toMap());
    debugPrint(conteudo);
    final resposta = await client?.post(Uri.parse(API_REST+"/fazenda/cadastrar"),
        headers: super.headers, body: conteudo, encoding: null);
    debugPrint(resposta!.statusCode.toString());
    return resposta.statusCode;

  }

}