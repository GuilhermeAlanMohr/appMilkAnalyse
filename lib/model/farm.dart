class Farm {

  int _codFarm;
  String _nomeFarm;
  String _nomeDonoFarm;
  String _cidade;
  int _quantidadeAnimais;
  double _tamanho;

  Farm (this._codFarm, this._nomeFarm, this._nomeDonoFarm, this._cidade, this._quantidadeAnimais, this._tamanho);

  double get tamanho => _tamanho;

  set tamanho(double value) {
    _tamanho = value;
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

  int get codFarm => _codFarm;

  set codFarm(int value) {
    _codFarm = value;
  }

}