import 'package:http/http.dart' as http;

class AbstractService {

  final String API_REST = 'http://10.0.2.2:8080';
  Map<String, String> headers = <String,String>{
    'Content-type':'application/json'
  };

}