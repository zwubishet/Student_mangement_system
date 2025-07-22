import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveToken(String acessToken, String refreshToken) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('accessToken', acessToken);
  await prefs.setString('refreshToken', refreshToken);
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('accessToken');
}

Future<bool> refreshAccessToken() async {
  final prefs = await SharedPreferences.getInstance();
  final refreshToken = prefs.getString('refreshToken');
  if (refreshToken == null) return false;

  final response = await http.post(
    Uri.parse('http://localhost:3000/api/auth/refresh-token'),
    headers: {'Authorization': 'Bearer $refreshToken'},
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    await prefs.setString('accessToken', json['accessToken']);
    return true;
  }

  return false;
}
