import 'package:appmilkanalyse/dao/farm_dao.dart';
import 'package:appmilkanalyse/model/analysis.dart';
import 'package:appmilkanalyse/model/farm.dart';
import 'package:appmilkanalyse/screens/detailsfarm.dart';
import 'package:appmilkanalyse/service/analysis_service.dart';
import 'package:appmilkanalyse/service/farm_service.dart';
import 'package:flutter/material.dart';

class ListaFarms extends StatefulWidget {

  @override
  State<ListaFarms> createState() => _ListaFarmsState();

}

class _ListaFarmsState extends State<ListaFarms> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Lista de Fazendas",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Fazendas'),
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
                  child: FutureBuilder<List<Farm>>(
                    future: FarmService().getFazendas(),
                    initialData: [],
                    builder: (context, snapshot){
                      final List<Farm>? fazendas = snapshot.data;
                      //return snapshot.hasData?
                      print(fazendas.toString());
                      return ListView.builder(
                        padding: const EdgeInsets.all(10.0),
                        itemCount: fazendas?.length,
                        itemBuilder: (context, i) {
                          final Farm farm = fazendas![i];
                          print(farm.toString());
                          return FarmItem(farm);
                        },
                      );
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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

class FarmItem extends StatelessWidget {

  final Farm _farm;
  FarmItem (this._farm);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.push( context, MaterialPageRoute(builder: (context) {
                return DetailsFarm(this._farm);
              }));
            },
            leading: Icon(Icons.agriculture),
            title: Text(
              "Fazenda: "+this._farm.nomeFarm,
              style: TextStyle(
                  fontSize: 24
              ),
            ),
            subtitle: Text(
              "Dono da Fazenda: "+this._farm.nomeDonoFarm,
              style: TextStyle(
                  fontSize: 18
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
