class ClienteModel {
int idCliente;
String cgcCfo;
String email;
String nome;
String foto;
String password;
int tentativas;
String lastLogin;
bool aceiteTermo;
String token;
String refreshToken;

ClienteModel(
    {this.idCliente,
      this.cgcCfo,
      this.email,
      this.nome,
      this.foto,
      this.password,
      this.tentativas,
      this.lastLogin,
      this.aceiteTermo,
      this.token,
      this.refreshToken});

ClienteModel.fromJson(Map<String, dynamic> json) {
idCliente = json['idCliente'];
cgcCfo = json['cgcCfo'];
email = json['email'];
nome = json['nome'];
foto = json['foto'];
password = json['password'];
tentativas = json['tentativas'];
lastLogin = json['lastLogin'];
aceiteTermo = json['aceiteTermo'];
token = json['token'];
refreshToken = json['refreshToken'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['idCliente'] = this.idCliente;
  data['cgcCfo'] = this.cgcCfo;
  data['email'] = this.email;
  data['nome'] = this.nome;
  data['foto'] = this.foto;
  data['password'] = this.password;
  data['tentativas'] = this.tentativas;
  data['lastLogin'] = this.lastLogin;
  data['aceiteTermo'] = this.aceiteTermo;
  data['token'] = this.token;
  data['refreshToken'] = this.refreshToken;
  return data;
}
}