class ClienteModel {
  int idCliente;
  String nomeCliente;
  String emailCliente;
  String cgccfoCliente;
  String fotoCliente;
  bool termoAceiteCliente;
  String token;
  String refreshToken;

  ClienteModel(
      {this.idCliente,
      this.nomeCliente,
      this.emailCliente,
      this.cgccfoCliente,
      this.fotoCliente,
      this.termoAceiteCliente,
      this.token,
      this.refreshToken});

  ClienteModel.fromJson(Map<String, dynamic> json) {
    idCliente = json['idCliente'];
    nomeCliente = json['nomeCliente'];
    emailCliente = json['emailCliente'];
    cgccfoCliente = json['cgccfoCliente'];
    fotoCliente = json['fotoCliente'];
    termoAceiteCliente = json['termoAceiteCliente'];
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCliente'] = this.idCliente;
    data['nomeCliente'] = this.nomeCliente;
    data['emailCliente'] = this.emailCliente;
    data['cgccfoCliente'] = this.cgccfoCliente;
    data['fotoCliente'] = this.fotoCliente;
    data['termoAceiteCliente'] = this.termoAceiteCliente;
    data['token'] = this.token;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
