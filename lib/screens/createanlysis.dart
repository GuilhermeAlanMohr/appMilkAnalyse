import 'package:appmilkanalyse/dao/analysis_dao.dart';
import 'package:appmilkanalyse/model/analysis.dart';
import 'package:appmilkanalyse/model/farm.dart';
import 'package:appmilkanalyse/screens/home.dart';
import 'package:appmilkanalyse/screens/listanalysis.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:camera/camera.dart';

class CreateAnalysis extends StatelessWidget {

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

  final GlobalKey _formKey = GlobalKey();

  late List<CameraDescription> _cameras;
  late CameraDescription _firstCamera;

  void acessarCamera() async{
    this._cameras = await availableCameras();
    this._firstCamera = this._cameras.first;
  }

  @override
  Widget build(BuildContext context) {
    acessarCamera();
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
                      TakePictureScreen(
                        camera: this._firstCamera
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
                            Position position = await AnalysisDAO.requestLocation();
                            List<Analysis> lista = AnalysisDAO.listarAnalysis;
                            Analysis analysis = Analysis(lista.length, this._nomeController.text, DateTime.now(),
                                this._testeCEController.text, this._cmtController.text, double.parse(this._ccsController.text),
                                double.parse(this._cbtController.text), this._residuosAntibioticosController.text, this._saborController.text,
                                this._corController.text, this._odorController.text, this._viscusidadeController.text, this._conservacaoController.text,
                                Farm (4, 'Pintado', 'Leonardo Medeiros', 'Venâncio Aires/RS', 10, 8, position));
                            AnalysisDAO.adicionar(analysis);
                            Navigator.push( context, MaterialPageRoute(builder: (context) {
                              return ListaAnalisis();
                            }));
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
}

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next steps.
    return Container();
  }
}
