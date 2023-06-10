class UserLogin {

  String _email;
  String _senha;

  UserLogin (this._email, this._senha);

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  Map<String, dynamic> toMap() {
    return {
      'email' : _email,
      'senha': _senha,
    };
  }

  static UserLogin fromMap (Map<String, dynamic> userMap){
    return new UserLogin(userMap['email'], userMap['senha']);
  }

  @override
  String toString() {
    return 'UserLogin{_email: $_email, _senha: $_senha}';
  }
}