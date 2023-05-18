import 'package:appmilkanalyse/dao/farm_dao.dart';
import 'package:appmilkanalyse/model/farm.dart';
import 'package:appmilkanalyse/screens/detailsfarm.dart';
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
                  child: ListView.builder(
                    itemCount: FarmDAO.listarFarms.length,
                    itemBuilder: (context, index){
                      final Farm f = FarmDAO.listarFarms[index];
                      return FarmItem(f);
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
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {
            Navigator.push( context, MaterialPageRoute(builder: (context) {
              return DetailsFarm(this._farm);
            }));
          },
          leading: Icon(Icons.agriculture),
          title: Text(
            this._farm.nomeFarm,
            style: TextStyle(
                fontSize: 24
            ),
          ),
          subtitle: Text(
            this._farm.nomeDonoFarm,
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
      ]
    );
  }
}
