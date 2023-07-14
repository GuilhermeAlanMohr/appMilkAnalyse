import 'package:geolocator/geolocator.dart';

class Farm {

  int? _codFarm;
  String _nomeFarm;
  String _nomeDonoFarm;
  String _cidade;
  int _quantidadeAnimais;
  double _tamanho;
  double _latitude;
  double _longitude;

  Farm (this._codFarm, this._nomeFarm, this._nomeDonoFarm, this._cidade, this._quantidadeAnimais, this._tamanho, this._latitude, this._longitude);

  double get tamanho => _tamanho;

  set tamanho(double value) {
    _tamanho = value;
  }

  double get latitude => _latitude;

  set latitude(double value) {
    _latitude = value;
  }

  double get longitude => _longitude;

  set longitude(double value) {
    _longitude = value;
  }

  int get quantidadeAnimais => _quantidadeAnimais;

  set quantidadeAnimais(int value) {
    _quantidadeAnimais = value;
  }

  String get cidade => _cidade;

  set cidade(String value) {
    _cidade = value;
  }

  String get nomeDonoFarm => _nomeDonoFarm;

  set nomeDonoFarm(String value) {
    _nomeDonoFarm = value;
  }

  String get nomeFarm => _nomeFarm;

  set nomeFarm(String value) {
    _nomeFarm = value;
  }

  int? get codFarm => _codFarm;

  set codFarm(int? value) {
    _codFarm = value;
  }

  Map<String, dynamic> toMap() {
    return {
      'codFarm' : _codFarm,
      'nomeFarm' : _nomeFarm,
      'nomeDonoFarm' : _nomeDonoFarm,
      'cidade': _cidade,
      'tamanho': _tamanho,
      'quantidadeAnimais': _quantidadeAnimais,
      'latitude': _latitude,
      'longitude': _longitude,
    };
  }

  factory Farm.fromMap (Map<String, dynamic> json){
    return new Farm(json['codFarm'], json['nomeFarm'], json['nomeDonoFarm'], json['cidade'], json['quantidadeAnimais'],json['tamanho'],json['latitude'],json['longitude']);
  }

  @override
  String toString() {
    return 'Farm{_codFarm: $_codFarm, _nomeFarm: $_nomeFarm, _nomeDonoFarm: $_nomeDonoFarm, _cidade: $_cidade, _quantidadeAnimais: $_quantidadeAnimais, _tamanho: $_tamanho, _latitude: $_latitude, _longitude: $_longitude }';
  }
}