class User {

  int _codUser;
  String _nomeUser;
  String _email;
  String _token;
  String _senha;

  User (this._codUser, this._nomeUser, this._email, this._senha, this._token);

  int get codUser => _codUser;

  set codUser(int value) {
    _codUser = value;
  }

  String get nomeUser => _nomeUser;

  set nomeUser(String value) {
    _nomeUser = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  Map<String, dynamic> toMap() {
    return {
      'codUser' : _codUser,
      'nomeUser' : _nomeUser,
      'email' : _email,
      'token': _token,
      'senha': _senha,
    };
  }

  factory User.fromMap (Map<String, dynamic> userMap){
    return new User(userMap['codUser'], userMap['nomeUser'], userMap['email'], userMap['senha'], userMap['token']);
  }

  @override
  String toString() {
    return 'User{_codUser: $_codUser, _nomeUser: $_nomeUser, _email: $_email, _token: $_token, _senha: $_senha}';
  }
}