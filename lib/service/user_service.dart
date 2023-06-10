import 'dart:convert';

import 'package:appmilkanalyse/dao/user_dao.dart';
import 'package:appmilkanalyse/model/user.dart';
import 'package:appmilkanalyse/service/abstract_service.dart';
import 'package:http/http.dart' as http;

class UserService extends AbstractService{

  Future<bool> login({required String email, required String senha}) async {

    //print('fazer requisição para o back');
    //print('pegar resposta do back');

    final conteudo = json.encode(<String, String>{'login':email, 'senha':senha});

    final resposta = await http.post(Uri.parse(API_REST+'/login'),
        headers: headers, body: conteudo, encoding: null);

    if(resposta.statusCode == 200){

      User u = User.fromMap(jsonDecode(resposta.body));
      print(u.email);
      print(u.token);
      new UserDAO().adicionarUser(u);
      return true;

    } else {
      print('problemas '+resposta.statusCode.toString());
      print('erro: '+resposta.body.toString());
      return false;
    }

    return false;

  }

}