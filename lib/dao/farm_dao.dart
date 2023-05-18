import 'package:appmilkanalyse/model/farm.dart';

class FarmDAO {

  static final List<Farm> _listFarms = [];

  static get listarFarms {

    return _listFarms;

  }

  static adicionar(Farm f) {
    _listFarms.add(f);
  }

}