import 'package:appmilkanalyse/security/auth_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

class AbstractService {

  InterceptedClient? client;

  AbstractService(){
    client = InterceptedClient.build(interceptors: [
      AuthInterceptor()
    ]);
  }

  final String API_REST = 'http://10.0.2.2:5000';
  Map<String, String> headers = <String,String>{
    'Content-Type':'application/json'
  };

}