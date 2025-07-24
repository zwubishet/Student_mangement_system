import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_management_system_app/services/loginServices.dart';

Future<Map<String, dynamic>> studentData(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final token = await getToken(); // getToken must return a String

  var res = await http.get(
    Uri.parse("http://localhost:3000/api/user/profile"),
    headers: {"Authorization": "Bearer $token"},
  );

  if (res.statusCode == 403 || res.statusCode == 401) {
    bool refreshed = await refreshAccessToken();
    if (refreshed) {
      String? newToken = prefs.getString('accessToken');
      res = await http.get(
        Uri.parse("http://localhost:3000/api/user/profile"),
        headers: {"Authorization": "Bearer $newToken"},
      );
    } else {
      await Navigator.popAndPushNamed(context, "/");
    }
  }

  if (res.statusCode != 200) {
    throw Exception('Failed to load profile: ${res.statusCode}');
  }

  // Parse the JSON response
  return jsonDecode(res.body);
}

Future<List<dynamic>> studentGrade(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final token = await getToken(); // getToken must return a String
  if (token == null) {
    throw Exception("Token is missing");
  }
  var res = await http.get(
    Uri.parse("http://localhost:3000/api/grade"),
    headers: {"Authorization": "Bearer $token"},
  );

  if (res.statusCode == 403 || res.statusCode == 401) {
    bool refreshed = await refreshAccessToken();
    if (refreshed) {
      String? newToken = prefs.getString('accessToken');
      res = await http.get(
        Uri.parse("http://localhost:3000/api/grade"),
        headers: {"Authorization": "Bearer $newToken"},
      );
    } else {
      await Navigator.popAndPushNamed(context, "/");
    }
  }

  if (res.statusCode != 200) {
    // throw Exception('Failed to load profile: ${res.statusCode}');
    await Navigator.popAndPushNamed(context, "/");
  }

  // Parse the JSON response
  return jsonDecode(res.body);
}

Future<Map<String, dynamic>> semesterSubjectResult(
  BuildContext context,
  String year,
  String semester,
) async {
  final prefs = await SharedPreferences.getInstance();
  final token = await getToken();

  var res = await http.get(
    Uri.parse("http://localhost:3000/api/grade/$year/$semester"),
    headers: {"Authorization": "Bearer $token"},
  );

  if (res.statusCode == 403 || res.statusCode == 401) {
    bool refreshed = await refreshAccessToken();
    if (refreshed) {
      String? newToken = prefs.getString('accessToken');
      res = await http.get(
        Uri.parse("http://localhost:3000/api/grade/$year/$semester"),
        headers: {"Authorization": "Bearer $newToken"},
      );
    } else {
      await Navigator.popAndPushNamed(context, "/");
    }
  }

  if (res.statusCode != 200) {
    throw Exception('Failed to load semester result: ${res.statusCode}');
  }

  // Return the first item from the list
  final List<dynamic> resultList = jsonDecode(res.body);
  if (resultList.isEmpty) {
    throw Exception('No data available for this semester.');
  }

  return resultList.first;
}
