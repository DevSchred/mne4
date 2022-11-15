import 'package:http/http.dart' as http;
import 'dart:convert';

class CallApi {
  final String _url = 'http://18.116.46.98:7000/api/';
  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }
}

_setHeaders() => {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
