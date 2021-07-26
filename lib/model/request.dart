import 'package:http/http.dart' as http;

var endpoint = Uri.parse("https://newsapi.org");

class Request {
  final Uri url;

  Request(this.url);

  Future<http.Response> get() {
    return http.get(endpoint).timeout(Duration(minutes: 2));
  }
}
