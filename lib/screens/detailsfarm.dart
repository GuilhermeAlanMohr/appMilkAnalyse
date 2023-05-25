import 'package:appmilkanalyse/model/farm.dart';
import 'package:flutter/material.dart';

class DetailsFarm extends StatelessWidget {

  final Farm _farm;
  DetailsFarm(this._farm);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Detalhes da Fazenda",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Detalhes da Fazenda'),
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
                        "Código da Fazenda: ${this._farm.codFarm}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Nome da Fazenda: ${this._farm.nomeFarm}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Nome do Dono: ${this._farm.nomeDonoFarm}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Cidade: ${this._farm.cidade}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Quantidades de Vacas produtoras de leite: ${this._farm.quantidadeAnimais}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Tamanho da Fazenda: ${this._farm.tamanho}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Latitude: ${this._farm.location.latitude}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: Text(
                        "Longitude: ${this._farm.location.longitude}",
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
