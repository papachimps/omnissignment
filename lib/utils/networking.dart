import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String urlString;

  NetworkHelper({
    required this.urlString,
  });

  Future getData() async {
    http.Response response = await http.get(Uri.parse(urlString));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else
      print(response.statusCode);
  }
}
