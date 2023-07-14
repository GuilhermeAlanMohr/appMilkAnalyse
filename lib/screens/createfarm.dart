import 'package:appmilkanalyse/dao/farm_dao.dart';
import 'package:appmilkanalyse/model/farm.dart';
import 'package:appmilkanalyse/screens/listfarms.dart';
import 'package:appmilkanalyse/service/farm_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CreateFarm extends StatelessWidget {

  final TextEditingController _nomeFarmController = TextEditingController();
  final TextEditingController _nomeDonoController = TextEditingController();
  final TextEditingController _tamanhoController = TextEditingController();
  final TextEditingController _quantidadeAnimaisController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Cadastro de Fazenda",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Fazenda'),
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
                      child: TextField(
                        controller: this._nomeFarmController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(80.0)
                          ),
                          labelText: "Nome da Fazenda",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: TextField(
                        controller: this._nomeDonoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(80.0)
                          ),
                          labelText: "Nome do Dono da Fazenda",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: TextField(
                        controller: this._cidadeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(80.0)
                          ),
                          labelText: "Nome da Cidade/Sigla do Estado",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: this._tamanhoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0)
                          ),
                          labelText: "Tamanho",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: this._quantidadeAnimaisController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(80.0)
                          ),
                          labelText: "Quantidade de Animais",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: ElevatedButton.icon(
                        label: Text('Salvar'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)
                          )

                        ),
                        onPressed: () async {
                          Position _position = await FarmDAO.requestLocation();
                          debugPrint("Clicou no botão de Salvar");
                          if (this._tamanhoController.text != '' && this._cidadeController.text != null &&
                              this._quantidadeAnimaisController.text != null && this._nomeDonoController.text != '' &&
                              this._nomeFarmController.text != ''){
                            Farm f = Farm(null, this._nomeFarmController.text, this._nomeDonoController.text, this._cidadeController.text,
                                int.parse(this._quantidadeAnimaisController.text), double.parse(this._tamanhoController.text),
                                _position.latitude, _position.longitude);
                            int retorno = await FarmService().cadastrar(f);
                            if (retorno == 200) {
                              Navigator.push( context, MaterialPageRoute(builder: (context) {
                                return ListaFarms();
                              }));
                            } else {
                              debugPrint("Problemas ao cadastrar Fazenda");
                            }
                          }
                        },
                        icon: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                          this._nomeFarmController.text = "";
                          this._nomeDonoController.text = "";
                          this._quantidadeAnimaisController.text = "";
                          this._cidadeController.text = "";
                          this._tamanhoController.text = "";
                        },
                        icon: Icon(Icons.clear, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: ElevatedButton.icon(
                        label: Text('Voltar'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
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
