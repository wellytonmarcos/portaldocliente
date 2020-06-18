import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FinanceiroModel {
  Future<Map> getLastsBoletos() async {
    var url = "https://5edacff998b7f500160dc8cf.mockapi.io/api/boletos";
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

  Future<Map> getPosicao() async {
    var url =
        "https://5edacff998b7f500160dc8cf.mockapi.io/api/posicao-financeira";
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

  Future<Map> getParcelas() async {
    var url = "https://5edacff998b7f500160dc8cf.mockapi.io/api/parcelas";
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
