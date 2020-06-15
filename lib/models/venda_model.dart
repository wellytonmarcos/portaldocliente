class VendaModel {
  int codColigada;
  int codPessEmp;
  String nomeEmpreendimento;
  String imgEmpreendimento;
  int idVenda;
  String numUnidade;
  String numSubunidade;
  String dataVenda;
  String dataEntrega;
  String valorTotal;
  String valorFinanciado;
  String valorSn;
  String valorPago;
  String valorPendente;

  VendaModel(
      {this.codColigada,
      this.codPessEmp,
      this.nomeEmpreendimento,
      this.imgEmpreendimento,
      this.idVenda,
      this.numUnidade,
      this.numSubunidade,
      this.dataVenda,
      this.dataEntrega,
      this.valorTotal,
      this.valorFinanciado,
      this.valorSn,
      this.valorPago,
      this.valorPendente});

  VendaModel.fromJson(Map<String, dynamic> json) {
    codColigada = json['codColigada'];
    codPessEmp = json['codPessEmp'];
    nomeEmpreendimento = json['nomeEmpreendimento'];
    imgEmpreendimento = json['imgEmpreendimento'];
    idVenda = json['idVenda'];
    numUnidade = json['numUnidade'];
    numSubunidade = json['numSubunidade'];
    dataVenda = json['dataVenda'];
    dataEntrega = json['dataEntrega'];
    valorTotal = json['valorTotal'];
    valorFinanciado = json['valorFinanciado'];
    valorSn = json['valorSn'];
    valorPago = json['valorPago'];
    valorPendente = json['valorPendente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codColigada'] = this.codColigada;
    data['codPessEmp'] = this.codPessEmp;
    data['nomeEmpreendimento'] = this.nomeEmpreendimento;
    data['imgEmpreendimento'] = this.imgEmpreendimento;
    data['idVenda'] = this.idVenda;
    data['numUnidade'] = this.numUnidade;
    data['numSubunidade'] = this.numSubunidade;
    data['dataVenda'] = this.dataVenda;
    data['dataEntrega'] = this.dataEntrega;
    data['valorTotal'] = this.valorTotal;
    data['valorFinanciado'] = this.valorFinanciado;
    data['valorSn'] = this.valorSn;
    data['valorPago'] = this.valorPago;
    data['valorPendente'] = this.valorPendente;
    return data;
  }
}