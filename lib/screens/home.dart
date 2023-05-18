import 'package:appmilkanalyse/dao/analysis_dao.dart';
import 'package:appmilkanalyse/dao/farm_dao.dart';
import 'package:appmilkanalyse/model/analysis.dart';
import 'package:appmilkanalyse/model/farm.dart';
import 'package:appmilkanalyse/screens/createanlysis.dart';
import 'package:appmilkanalyse/screens/createfarm.dart';
import 'package:appmilkanalyse/screens/listanalysis.dart';
import 'package:appmilkanalyse/screens/listfarms.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final String usuario = 'Admin';

  _geraAnalysis() {

    Analysis a = Analysis(1, "Amostra 1", DateTime.now(), "Não apresenta alterações", "Animal não apresenta mastite", 200,
        10, "Não apresenta resíduos", "Sabor apresenta leve alteração", "Coloração normal", "Não apresenta odor",
        "Viscosidade normal", "Conservação é realizada de forma correta",
        Farm(1, 'Dourados', 'Pedro Ribeiro', 'Santa Maria/RS', 20, 10));

    Analysis a1 = Analysis(2, "Amostra 2", DateTime.now(), "Não apresenta alterações", "Animal não apresenta mastite", 120,
        12, "Não apresenta resíduos", "Sabor não apresenta alteração", "Coloração anormal", "Apresenta odor leve",
        "Viscosidade normal", "Conservação é realizada de forma correta",
        Farm(2, 'Baú do Ouro', 'João dos Santos', 'Venâncio Aires/RS', 35, 15));

    AnalysisDAO.adicionar(a);
    AnalysisDAO.adicionar(a1);

  }

  _geraFarms () {

    Farm f = Farm(1, 'Dourados', 'Pedro Ribeiro', 'Santa Maria/RS', 20, 10);
    Farm f1 = Farm(2, 'Baú do Ouro', 'João dos Santos', 'Venâncio Aires/RS', 35, 15);
    Farm f2 = Farm(3, 'Recanto do Alemão', 'Fernando Cardoso', 'Santa Cruz do Sul/RS', 24, 12);
    Farm f3 = Farm(4, 'Pintado', 'Leonardo Medeiros', 'Venâncio Aires/RS', 10, 8);

    FarmDAO.adicionar(f);
    FarmDAO.adicionar(f1);
    FarmDAO.adicionar(f2);
    FarmDAO.adicionar(f3);
  }

  @override
  Widget build(BuildContext context) {
    _geraFarms();
    _geraAnalysis();
    return MaterialApp(
      title: 'Home',
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
                    padding: EdgeInsets.fromLTRB(40, 20, 20, 10),
                    child: Text('Bem Vindo, Usuario '+usuario),
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
                        Navigator.push( context, MaterialPageRoute(builder: (context) {
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
                        Navigator.push( context, MaterialPageRoute(builder: (context) {
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
                        Navigator.push( context, MaterialPageRoute(builder: (context) {
                          return CreateAnalysis();
                        }));
                      },
                      icon: Icon(Icons.assignment_outlined, color: Colors.white),
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
                        Navigator.push( context, MaterialPageRoute(builder: (context) {
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
}
