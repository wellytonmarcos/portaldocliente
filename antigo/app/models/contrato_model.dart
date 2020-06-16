class ContratoModel {
  int numVenda;
  int codPessEmpr;
  String numUnd;
  String numSubUnd;
  String miniEmpImgPath;
  String horizontalEmpImgPath;
  String statusVenda;

  ContratoModel(
      {this.numVenda,
        this.codPessEmpr,
        this.numUnd,
        this.numSubUnd,
        this.miniEmpImgPath,
        this.horizontalEmpImgPath,
        this.statusVenda});

  ContratoModel.fromJson(Map<String, dynamic> json) {
    numVenda = json['numVenda'];
    codPessEmpr = json['codPessEmpr'];
    numUnd = json['numUnd'];
    numSubUnd = json['numSubUnd'];
    miniEmpImgPath = json['miniEmpImgPath'];
    horizontalEmpImgPath = json['horizontalEmpImgPath'];
    statusVenda = json['statusVenda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numVenda'] = this.numVenda;
    data['codPessEmpr'] = this.codPessEmpr;
    data['numUnd'] = this.numUnd;
    data['numSubUnd'] = this.numSubUnd;
    data['miniEmpImgPath'] = this.miniEmpImgPath;
    data['horizontalEmpImgPath'] = this.horizontalEmpImgPath;
    data['statusVenda'] = this.statusVenda;
    return data;
  }
}