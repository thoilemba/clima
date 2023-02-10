import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  final String url;

  NetworkHelper({required this.url});

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    var decodeData = jsonDecode(response.body);
    return decodeData;
  }
}

// 37.4219983    35
// -122.084      139