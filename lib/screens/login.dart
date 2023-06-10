import 'package:appmilkanalyse/dao/analysis_dao.dart';
import 'package:appmilkanalyse/dao/user_dao.dart';
import 'package:appmilkanalyse/model/user.dart';
import 'package:appmilkanalyse/screens/home.dart';
import 'package:appmilkanalyse/service/analysis_service.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: FlutterLogo(size: 80),
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 70),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: TextField(
                        controller: this._emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(80.0)
                            ),
                            labelText: "E-mail",
                            prefixIcon: Icon(Icons.email)
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: TextField(
                        controller: this._passwordController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(80.0)
                            ),
                            labelText: "Password",
                            prefixIcon: Icon(Icons.password)
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton.icon(
                        label: Text('Entrar'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)
                            )
                        ),
                        onPressed: () async {
                          debugPrint("Clicou no botão de Login");
                          final String email = this._emailController.text;
                          final String password = this._passwordController.text;
                          if (email == 'admin@admin.com' && password == '1234') {

                            User user = await AnalysisService().getUsers();
                            debugPrint(user.toString());

                            final User u = new User(1, 'Guilherme', "gui@gmail.com", '1234', 'teste');
                            UserDAO().adicionarUser(u);

                            Navigator.push( context, MaterialPageRoute(builder: (context) {
                              return Home();
                            }));
                          } else {
                            debugPrint("E-mail ou Senha erradas");
                          }
                        },
                        icon: Icon(Icons.login, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton.icon(
                        label: Text('Cancelar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)
                          )
                        ),
                        onPressed: () {
                          debugPrint("Clicou no botão de Cancelar");
                          this._emailController.text = "";
                          this._passwordController.text = "";
                        },
                        icon: Icon(Icons.clear, color: Colors.white),
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
