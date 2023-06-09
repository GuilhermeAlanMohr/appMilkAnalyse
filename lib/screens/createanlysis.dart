import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:appmilkanalyse/dao/analysis_dao.dart';
import 'package:appmilkanalyse/dao/farm_dao.dart';
import 'package:appmilkanalyse/model/analysis.dart';
import 'package:appmilkanalyse/model/farm.dart';
import 'package:appmilkanalyse/screens/home.dart';
import 'package:appmilkanalyse/screens/imageviewer.dart';
import 'package:appmilkanalyse/screens/listanalysis.dart';
import 'package:appmilkanalyse/screens/takepickturescreen.dart';
import 'package:appmilkanalyse/service/analysis_service.dart';
import 'package:appmilkanalyse/service/farm_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CreateAnalysis extends StatefulWidget {

  CreateAnalysis(Uint8List? this._imagePath);
  final Uint8List? _imagePath;

  @override
  State<CreateAnalysis> createState() => _CreateAnalysisState(_imagePath);

}

class _CreateAnalysisState extends State<CreateAnalysis>{

  _CreateAnalysisState(Uint8List? this._pathImagem);

  final Uint8List? _pathImagem;

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _dataOrdenhaController = TextEditingController();
  final TextEditingController _testeCEController = TextEditingController();
  final TextEditingController _cmtController = TextEditingController();
  final TextEditingController _ccsController = TextEditingController();
  final TextEditingController _cbtController = TextEditingController();
  final TextEditingController _residuosAntibioticosController = TextEditingController();
  final TextEditingController _saborController = TextEditingController();
  final TextEditingController _corController = TextEditingController();
  final TextEditingController _odorController = TextEditingController();
  final TextEditingController _viscusidadeController = TextEditingController();
  final TextEditingController _conservacaoController = TextEditingController();
  Farm? _farmSelecionada;
  late Future<List<Farm>> _listaFarms;

  final GlobalKey _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _getFarms();
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Cadastro de Análise",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Análise'),
          backgroundColor: Colors.blue,
        ),
        body: Form(
          key: _formKey,
          child: Container(
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
                    controller: this._nomeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0)
                      ),
                      labelText: "Nome da Análise",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                  child: TextField(
                    keyboardType: TextInputType.datetime,
                    controller: this._dataOrdenhaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0)
                      ),
                      labelText: "Data da Ordenha",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                  child: TextField(
                    controller: this._testeCEController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0)
                      ),
                      labelText: "Teste da Caneca Escura",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                  child: TextField(
                    controller: this._cmtController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0)
                      ),
                      labelText: "Relátorio de CMT",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: this._ccsController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0)
                      ),
                      labelText: "Relatório de Contagem de Células Somáticas (CCS)",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: this._cbtController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0)
                      ),
                      labelText: "Relatório de Contagem de Bactérias Totais (CBT)",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                  child: TextField(
                    controller: this._residuosAntibioticosController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0)
                      ),
                      labelText: "Resíduos Antibióticos",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                  child: TextField(
                    controller: this._saborController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0)
                      ),
                      labelText: "Sabor",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                  child: TextField(
                    controller: this._corController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0)
                      ),
                      labelText: "Cor",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                  child: TextField(
                    controller: this._odorController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0)
                      ),
                      labelText: "Odor",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                  child: TextField(
                    controller: this._viscusidadeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0)
                      ),
                      labelText: "Viscosidade",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                  child: TextField(
                    controller: this._conservacaoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0)
                      ),
                      labelText: "Conservação do Leite",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
                  child: FutureBuilder<List<Farm>>(
                    future: _listaFarms,
                    builder: (context, snapshot){
                      return DropdownButton<Farm>(
                        value: _farmSelecionada,
                        onChanged: (Farm? newValue) {
                          setState(() {
                            print("FAZENDA = "+newValue.toString());
                            _farmSelecionada = newValue;
                          });
                        },
                        items: snapshot.data?.map<DropdownMenuItem<Farm>>((Farm farm) {
                          return DropdownMenuItem<Farm>(
                            value: farm,
                            child: Text(farm.nomeFarm),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                this._pathImagem != null ?
                  Container(
                    child: ImageViewer(imageBytes: this._pathImagem!!),
                    margin: EdgeInsets.all(15),
                  ) : Container(),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: ElevatedButton.icon(
                      label: Text('Tirar Foto'),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)
                          )
                      ),
                      onPressed: () async{
                        debugPrint("Tirar Foto");
                        WidgetsFlutterBinding.ensureInitialized();
                        final cameras = await availableCameras();
                        final firstCamera = cameras.first;
                        Navigator.push( context, MaterialPageRoute(builder: (context) {
                          return TakePictureScreen(camera: firstCamera);
                        }));
                      },
                      icon: Icon(Icons.camera_alt, color: Colors.white),
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
                        debugPrint("Clicou no botão de Salvar");
                        Analysis analysis = Analysis(null, this._nomeController.text, DateTime.now(),
                            this._testeCEController.text, this._cmtController.text, double.parse(this._ccsController.text),
                            double.parse(this._cbtController.text), this._residuosAntibioticosController.text, this._saborController.text,
                            this._corController.text, this._odorController.text, this._viscusidadeController.text, this._conservacaoController.text,
                            _farmSelecionada!!, this._pathImagem!!) ;
                        int retorno = await AnalysisService().cadastrar(analysis);
                        if (retorno == 200) {
                          Navigator.push( context, MaterialPageRoute(builder: (context) {
                            return ListaAnalisis();
                          }));
                        } else {
                          debugPrint("Falha ao salvar Análise");
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
                        this._nomeController.text = "";
                        this._cbtController.text = "";
                        this._ccsController.text = "";
                        this._cmtController.text = "";
                        this._testeCEController.text = "";
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
      ),
    );
  }
  Future<void> _getFarms() async{
    setState(() {
      _listaFarms = FarmService().getFazendas();
    });
  }
}