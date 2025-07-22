import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_management_system_app/services/loginServices.dart';

Future<Map<String, dynamic>> studentData() async {
  final prefs = await SharedPreferences.getInstance();
  final token = await getToken(); // getToken must return a String

  var res = await http.get(
    Uri.parse("http://localhost:3000/api/user/profile"),
    headers: {"Authorization": "Bearer $token"},
  );

  if (res.statusCode == 401) {
    bool refreshed = await refreshAccessToken();
    if (refreshed) {
      String? newToken = await prefs.getString('accessToken');
      res = await http.get(
        Uri.parse("http://localhost:3000/api/user/profile"),
        headers: {"Authorization": "Bearer $newToken"},
      );
    } else {
      throw Exception("Session expired. Please login again.");
    }
  }

  if (res.statusCode != 200) {
    throw Exception('Failed to load profile: ${res.statusCode}');
  }

  // Parse the JSON response
  return jsonDecode(res.body);
}

Future<List<dynamic>> studentGrade() async {
  final prefs = await SharedPreferences.getInstance();
  final token = await getToken(); // getToken must return a String
  if (token == null) {
    throw Exception("Token is missing");
  }
  var res = await http.get(
    Uri.parse("http://localhost:3000/api/grade"),
    headers: {"Authorization": "Bearer $token"},
  );

  if (res.statusCode == 401) {
    bool refreshed = await refreshAccessToken();
    if (refreshed) {
      String? newToken = await prefs.getString('accessToken');
      res = await http.get(
        Uri.parse("http://localhost:3000/api/user/profile"),
        headers: {"Authorization": "Bearer $newToken"},
      );
    } else {
      throw Exception("Session expired. Please login again.");
    }
  }

  if (res.statusCode != 200) {
    throw Exception('Failed to load profile: ${res.statusCode}');
  }

  // Parse the JSON response
  return jsonDecode(res.body);
}
