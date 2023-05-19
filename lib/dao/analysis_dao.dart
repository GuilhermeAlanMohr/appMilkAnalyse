import 'package:appmilkanalyse/model/analysis.dart';
import 'package:appmilkanalyse/model/farm.dart';

class AnalysisDAO {

  static final List<Analysis> _listAnalysis = [];

  static get populaAnalysis{
    Analysis a = Analysis(1, "Amostra 1", DateTime.now(), "Não apresenta alterações", "Animal não apresenta mastite", 200,
        10, "Não apresenta resíduos", "Sabor apresenta leve alteração", "Coloração normal", "Não apresenta odor",
        "Viscosidade normal", "Conservação é realizada de forma correta",
        Farm(1, 'Dourados', 'Pedro Ribeiro', 'Santa Maria/RS', 20, 10));

    Analysis a1 = Analysis(2, "Amostra 2", DateTime.now(), "Não apresenta alterações", "Animal não apresenta mastite", 120,
        12, "Não apresenta resíduos", "Sabor não apresenta alteração", "Coloração anormal", "Apresenta odor leve",
        "Viscosidade normal", "Conservação é realizada de forma correta",
        Farm(2, 'Baú do Ouro', 'João dos Santos', 'Venâncio Aires/RS', 35, 15));

    AnalysisDAO.adicionar(a);
    AnalysisDAO.adicionar(a1);
  }

  static get listarAnalysis {

    return _listAnalysis;

  }

  static adicionar(Analysis a) {
    _listAnalysis.add(a);
  }

}