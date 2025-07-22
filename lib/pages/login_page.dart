import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:student_management_system_app/components/BackgroundCustompaint.dart';
import 'package:student_management_system_app/components/BlueBackgroundCustompaint.dart';
import 'package:student_management_system_app/services/loginServices.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> login(String? username, String? password, String? role) async {
      if (username == null ||
          username.isEmpty ||
          password == null ||
          password.isEmpty ||
          role == null ||
          role.isEmpty) {
        print('All fields are required');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter username, password, and role')),
        );
        return;
      }

      try {
        final res = await http.post(
          Uri.parse('http://localhost:3000/api/auth/login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'identifier': username,
            'password': password,
            'role': role,
          }),
        );

        if (res.statusCode == 200) {
          final data = json.decode(res.body);
          final acessToken = data['accessToken'];
          final refreshToken = data['refreshToken'];
          await saveToken(acessToken, refreshToken);
          Navigator.pushReplacementNamed(context, "/home");
        } else {
          print('Login failed: ${res.body}');
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Login failed')));
        }
      } catch (e) {
        print('Login error: $e');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Something went wrong')));
      }
    }

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            '© 2023 Dream School. All rights reserved.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: BackgroundCustomPainter(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: CustomPaint(
              size: MediaQuery.of(context).size,
              painter: BlueBackgroundCustomPainter(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/student_login.jpg'),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'To',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'Dream School',
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: roleController,
                      decoration: InputDecoration(
                        labelText: 'Role',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 200.0),
                  child: Text.rich(
                    TextSpan(
                      text: 'Forgot Password? ',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle forgot password action
                        },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.lightBlueAccent],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {
                      login(
                        usernameController.text,
                        passwordController.text,
                        roleController.text,
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
