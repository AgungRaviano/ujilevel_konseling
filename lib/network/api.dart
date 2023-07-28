import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl = 'http://great-wondering.at.ply.gg:42680/api';

  static Future<http.Response> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/auth/login');
    final response = await http.post(url, body: {
      'email': email,
      'password': password,
    });

    return response;
  }

  // Tambahkan metode lain untuk endpoint API lainnya
}
