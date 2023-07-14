import 'dart:io';

import 'package:appmilkanalyse/dao/user_dao.dart';
import 'package:appmilkanalyse/model/user.dart';
import 'package:flutter/widgets.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class AuthInterceptor implements InterceptorContract{

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    debugPrint("**************TESTANDO**************");
    User usuario = await UserDAO().getUser();

    if (usuario != null ) {

      debugPrint("Token = "+usuario.token);
      data.headers.addAll(<String, String> {
        HttpHeaders.authorizationHeader: 'Bearer ${usuario.token}'
      });

    } else {
      debugPrint('Requisição sem usuário logado');
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async{
    return data;
  }

}