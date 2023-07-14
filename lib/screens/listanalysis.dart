import 'package:appmilkanalyse/dao/analysis_dao.dart';
import 'package:appmilkanalyse/model/analysis.dart';
import 'package:appmilkanalyse/screens/detailsanalysis.dart';
import 'package:appmilkanalyse/service/analysis_service.dart';
import 'package:flutter/material.dart';

class ListaAnalisis extends StatefulWidget {

  @override
  State<ListaAnalisis> createState() => _ListaAnalisisState();

}

class _ListaAnalisisState extends State<ListaAnalisis> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Lista de Análises",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Análises'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: FlutterLogo(size: 80),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
              ),
              Expanded(
                child: Container(
                  child: FutureBuilder<List<Analysis>>(
                    future: AnalysisService().getAnalises(),
                    initialData: [],
                    builder: (context, snapshot){
                      final List<Analysis>? analises = snapshot.data;
                      //return snapshot.hasData?
                      return ListView.builder(
                        padding: const EdgeInsets.all(10.0),
                        itemCount: analises?.length,
                        itemBuilder: (context, i) {
                          final Analysis analysis = analises![i];
                          return AnalysisItem(analysis);
                        },
                      );
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: ElevatedButton.icon(
                  label: Text('Voltar'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)
                      )
                  ),
                  onPressed: () {
                    debugPrint("Clicou no botão de Voltar");
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.keyboard_return_outlined, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

}

class AnalysisItem extends StatelessWidget {

  final Analysis _analysis;
  AnalysisItem (this._analysis);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.push( context, MaterialPageRoute(builder: (context) {
                return DetailsAnalysis(this._analysis);
              }));
            },
            leading: Icon(Icons.assignment_outlined),
            title: Text(
              "Nome da Análise: "+this._analysis.nomeAnalysis,
              style: TextStyle(
                  fontSize: 24
              ),
            ),
          ),
          Divider(
            color: Colors.blueAccent,
            indent: 70.0,
            endIndent: 20,
            thickness: 1.0,
            height: 0.0,
          )
        ],
      ),
    );
  }
}
