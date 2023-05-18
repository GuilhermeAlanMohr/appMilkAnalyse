import 'package:appmilkanalyse/model/farm.dart';

class Analysis {

  int _codAnalysis;
  String _nomeAnalysis;
  DateTime _dataOrdenha;
  String _testeCaneca;
  String _cmt;
  double _ccs;
  double _cbt;
  String _residuosAntibioticos;
  String _sabor;
  String _cor;
  String _odor;
  String _viscusidade;
  String _conservacao;
  Farm _farm;

  Analysis (this._codAnalysis, this._nomeAnalysis, this._dataOrdenha, this._testeCaneca, this._cmt, this._ccs, this._cbt,
      this._residuosAntibioticos, this._sabor, this._cor, this._odor, this._viscusidade, this._conservacao, this._farm);

  String get conservacao => _conservacao;

  set conservacao(String value) {
    _conservacao = value;
  }

  String get viscusidade => _viscusidade;

  set viscusidade(String value) {
    _viscusidade = value;
  }

  String get odor => _odor;

  set odor(String value) {
    _odor = value;
  }

  String get cor => _cor;

  set cor(String value) {
    _cor = value;
  }

  String get sabor => _sabor;

  set sabor(String value) {
    _sabor = value;
  }

  String get residuosAntibioticos => _residuosAntibioticos;

  set residuosAntibioticos(String value) {
    _residuosAntibioticos = value;
  }

  double get cbt => _cbt;

  set cbt(double value) {
    _cbt = value;
  }

  double get ccs => _ccs;

  set ccs(double value) {
    _ccs = value;
  }

  String get cmt => _cmt;

  set cmt(String value) {
    _cmt = value;
  }

  String get testeCaneca => _testeCaneca;

  set testeCaneca(String value) {
    _testeCaneca = value;
  }

  DateTime get dataOrdenha => _dataOrdenha;

  set dataOrdenha(DateTime value) {
    _dataOrdenha = value;
  }

  String get nomeAnalysis => _nomeAnalysis;

  set nomeAnalysis(String value) {
    _nomeAnalysis = value;
  }

  int get codAnalysis => _codAnalysis;

  set codAnalysis(int value) {
    _codAnalysis = value;
  }

  Farm get farm => _farm;

  set farm(Farm value) {
    _farm = value;
  }
}