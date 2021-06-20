import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String _url;
  Network(this._url);

  Future<dynamic> getJsonData() async {
    var url = Uri.parse(_url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
    else return -1;
  }
}