import 'dart:io';
import 'dart:typed_data';

import 'package:appmilkanalyse/model/analysis.dart';
import 'package:appmilkanalyse/screens/imageviewer.dart';
import 'package:flutter/material.dart';

class DetailsAnalysis extends StatelessWidget {

  final Analysis _analysis;
  final Uint8List converter;

  DetailsAnalysis(this._analysis);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Detalhes da Análise",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Detalhes da Análise'),
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
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Descrição do Teste de Caneca Escura: ${this._analysis.testeCaneca}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Relatório do CMT: ${this._analysis.cmt}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Relatório de Contagem de Células Somáticas (CCS): ${this._analysis.ccs}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Relatório de Contagem de Bactérias Totais (CBT): ${this._analysis.cbt}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Resíduos Antibióticos: ${this._analysis.residuosAntibioticos}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Cor do Leite: ${this._analysis.cor}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Sabor do Leite: ${this._analysis.sabor}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Odor do Leite: ${this._analysis.odor}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Viscusidade do Leite: ${this._analysis.viscusidade}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Conservação do Leite: ${this._analysis.conservacao}",
                      ),
                    ),
                    Container(
                      child: ImageViewer(imageBytes: Uint8List.fromList(this._analysis.foto))
                    ),
                    // this._analysis.foto.isEmpty ? Container(
                    //   child: Text("Análise sem imagem armazenada"),
                    // ) : Container(
                    //   child: this._analysis.foto.startsWith("images/") ? Image.asset(this._analysis.foto) : Image.file(File(this._analysis.foto)),
                    //   margin: EdgeInsets.all(15),
                    // ),
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
