import 'package:appmilkanalyse/model/analysis.dart';

class AnalysisDAO {

  static final List<Analysis> _listAnalysis = [];

  static get listarAnalysis {

    return _listAnalysis;

  }

  static adicionar(Analysis a) {
    _listAnalysis.add(a);
  }

}