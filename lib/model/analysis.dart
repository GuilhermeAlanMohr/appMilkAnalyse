import 'dart:io';
import 'dart:ui';

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
  List<int> _foto;

  Analysis (this._codAnalysis, this._nomeAnalysis, this._dataOrdenha, this._testeCaneca, this._cmt, this._ccs, this._cbt,
      this._residuosAntibioticos, this._sabor, this._cor, this._odor, this._viscusidade, this._conservacao, this._farm, this._foto);

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


  List<int> get foto => _foto;

  set foto(List<int> foto){
    _foto = foto;
  }

  Map<String, dynamic> toMap() {
    return {
      'codAnalysis' : _codAnalysis,
      'nomeAnalysis' : _nomeAnalysis,
      'dataOrdenha' : _dataOrdenha,
      'testeCaneca': _testeCaneca,
      'cmt': _cmt,
      'ccs': _ccs,
      'cbt': _cbt,
      'residuosAntibioticos': _residuosAntibioticos,
      'sabor' : _sabor,
      'cor': _cor,
      'odor': _odor,
      'viscusidade': _viscusidade,
      'conservacao': _conservacao,
      'farm': _farm,
      'foto': _foto,
    };
  }

  factory Analysis.fromMap (Map<String, dynamic> json){
    return new Analysis(
      json['codAnalysis'],
      json['nomeAnalysis'],
      json['dataOrdenha'],
      json['testeCaneca'],
      json['cmt'],
      json['ccs'],
      json['cbt'],
      json['residuosAntibioticos'],
      json['sabor'],
      json['cor'],
      json['odor'],
      json['viscusidade'],
      json['conservacao'],
      json['farm'],
      json['foto'],
    );
  }

  @override
  String toString() {
    return 'Analysis{_codAnalysis: $_codAnalysis, _nomeAnalysis: $_nomeAnalysis, _dataOrdenha: $_dataOrdenha, _testeCaneca: $_testeCaneca, _cmt: $_cmt, _ccs: $_ccs, _cbt: $_cbt, _residuosAntibioticos: $_residuosAntibioticos, _sabor: $_sabor, _cor: $_cor, _odor: $_odor, _viscusidade: $_viscusidade, _conservacao: $_conservacao, _farm: $_farm, _foto: $_foto}';
  }
}