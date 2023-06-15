import 'package:appmilkanalyse/dao/analysis_dao.dart';
import 'package:appmilkanalyse/dao/farm_dao.dart';
import 'package:appmilkanalyse/dao/user_dao.dart';
import 'package:appmilkanalyse/model/user.dart';
import 'package:appmilkanalyse/screens/createanlysis.dart';
import 'package:appmilkanalyse/screens/createfarm.dart';
import 'package:appmilkanalyse/screens/listanalysis.dart';
import 'package:appmilkanalyse/screens/listfarms.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final String usuario = 'Admin';

  @override
  Widget build(BuildContext context) {
    carregarUsers();
    populaListas();
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
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
                      padding: EdgeInsets.fromLTRB(40, 20, 20, 10),
                      child: Text('Bem Vindo, Usuario ' + usuario),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton.icon(
                        label: Text('Cadastrar Fazenda'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)
                            )
                        ),
                        onPressed: () {
                          debugPrint("Clicou no botão de Cadastrar Fazenda");
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) {
                            return CreateFarm();
                          }));
                        },
                        icon: Icon(Icons.agriculture, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton.icon(
                        label: Text('Lista de Fazendas'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)
                            )
                        ),
                        onPressed: () {
                          debugPrint("Clicou no botão de Listagem das Fazendas");
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) {
                            return ListaFarms();
                          }));
                        },
                        icon: Icon(Icons.list, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton.icon(
                        label: Text('Cadastrar Análise'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)
                            )
                        ),
                        onPressed: () {
                          debugPrint("Clicou no botão de Cadastrar Análise");
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) {
                            return CreateAnalysis(null);
                          }));
                        },
                        icon: Icon(
                            Icons.assignment_outlined, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton.icon(
                        label: Text('Lista de Análises'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)
                            )
                        ),
                        onPressed: () {
                          debugPrint("Clicou no botão de Lista de Análises");
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) {
                            return ListaAnalisis();
                          }));
                        },
                        icon: Icon(Icons.list, color: Colors.white),
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

  static populaListas() async{
    await FarmDAO.populaFarms;
    await AnalysisDAO.populaAnalysis;
  }

  static void carregarUsers() async{
    final List<User> listaUsers = await UserDAO().getUsers();
    for (User u in listaUsers){
      debugPrint(u.toString());
    }
  }

}
