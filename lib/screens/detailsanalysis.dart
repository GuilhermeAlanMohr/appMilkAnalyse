import 'package:appmilkanalyse/model/analysis.dart';
import 'package:flutter/material.dart';

class DetailsAnalysis extends StatelessWidget {

  final Analysis _analysis;
  DetailsAnalysis(this._analysis);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cadastro de Análise",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Análise'),
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
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Código da Análise: ${this._analysis.codAnalysis}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Nome da Análise: ${this._analysis.nomeAnalysis}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Data da Ordenha: ${this._analysis.dataOrdenha}",
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
                )
            ),
          ),
        ),
      ),
    );
  }
}
