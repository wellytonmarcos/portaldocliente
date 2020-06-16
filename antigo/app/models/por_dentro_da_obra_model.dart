import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PorDentroDaObraModel {
  int idPdo;
  int numVenda;
  int codPessEmpr;
  int codColigada;
  int codFilial;
  String created;
  String month;
  String year;
  String empImgPath;
  String miniImgPath;
  String imgPath;

  PorDentroDaObraModel(
      {this.idPdo,
      this.numVenda,
      this.codPessEmpr,
      this.codColigada,
      this.codFilial,
      this.created,
      this.month,
      this.year,
      this.empImgPath,
      this.miniImgPath,
      this.imgPath});

  PorDentroDaObraModel.fromJson(Map<String, dynamic> json) {
    idPdo = json['idPdo'];
    numVenda = json['numVenda'];
    codPessEmpr = json['codPessEmpr'];
    codColigada = json['codColigada'];
    codFilial = json['codFilial'];
    created = json['created'];
    month = json['month'];
    year = json['year'];
    empImgPath = json['empImgPath'];
    miniImgPath = json['miniImgPath'];
    imgPath = json['imgPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPdo'] = this.idPdo;
    data['numVenda'] = this.numVenda;
    data['codPessEmpr'] = this.codPessEmpr;
    data['codColigada'] = this.codColigada;
    data['codFilial'] = this.codFilial;
    data['created'] = this.created;
    data['month'] = this.month;
    data['year'] = this.year;
    data['empImgPath'] = this.empImgPath;
    data['miniImgPath'] = this.miniImgPath;
    data['imgPath'] = this.imgPath;
    return data;
  }

  Future<Map> getLastsPdo() async {
    var url =
        "https://5edacff998b7f500160dc8cf.mockapi.io/api/por-dentro-da-obra";
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.get(
      url,
      headers: headers,
    );
    return json.decode(utf8.decode(response.bodyBytes));
  }
}
