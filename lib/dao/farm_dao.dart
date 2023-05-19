import 'package:appmilkanalyse/model/farm.dart';

class FarmDAO {

  static final List<Farm> _listFarms = [];

  static get listarFarms {

    return _listFarms;

  }

  static adicionar(Farm f) {
    _listFarms.add(f);
  }

  static get populaFarms{
    Farm f = Farm(1, 'Dourados', 'Pedro Ribeiro', 'Santa Maria/RS', 20, 10);
    Farm f1 = Farm(2, 'Baú do Ouro', 'João dos Santos', 'Venâncio Aires/RS', 35, 15);
    Farm f2 = Farm(3, 'Recanto do Alemão', 'Fernando Cardoso', 'Santa Cruz do Sul/RS', 24, 12);
    Farm f3 = Farm(4, 'Pintado', 'Leonardo Medeiros', 'Venâncio Aires/RS', 10, 8);

    FarmDAO.adicionar(f);
    FarmDAO.adicionar(f1);
    FarmDAO.adicionar(f2);
    FarmDAO.adicionar(f3);
  }

}