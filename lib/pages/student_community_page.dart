import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StudentCommunityPage extends StatefulWidget {
  const StudentCommunityPage({super.key});

  @override
  State<StudentCommunityPage> createState() => _StudentCommunityPageState();
}

class _StudentCommunityPageState extends State<StudentCommunityPage> {
  List<dynamic> posts = [];

  // Fetch community posts from the API
  Future<void> fetchPosts() async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/api/community/getPost'),
    );

    if (response.statusCode == 200) {
      setState(() {
        posts = jsonDecode(response.body);
      });
    } else {
      print("Failed to load posts");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPosts(); // Fetch posts when the page loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Student Community",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "Explore and connect with fellow students",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/student_login.jpg'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "What's on your mind?",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Posts list
            Column(
              children: List.generate(posts.length, (index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.symmetric(vertical: 12),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Post Title
                      Text(
                        posts[index]['title'] ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 6),
                      // Post Content
                      Text(
                        posts[index]['content'] ?? '',
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 10),
                      // Post Image
                      posts[index]['image'] != null
                          ? Image.network(
                              posts[index]['image'],
                              width: double.infinity,
                              height: 180,
                              fit: BoxFit.cover,
                            )
                          : SizedBox.shrink(),
                      SizedBox(height: 10),
                      // Post Footer: Type & Date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            posts[index]['type'] ?? 'General',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueAccent,
                            ),
                          ),
                          Text(
                            posts[index]['createdAt'] != null
                                ? DateTime.tryParse(
                                            posts[index]['createdAt'],
                                          ) !=
                                          null
                                      ? "${DateTime.parse(posts[index]['createdAt']).year}-${DateTime.parse(posts[index]['createdAt']).month.toString().padLeft(2, '0')}-${DateTime.parse(posts[index]['createdAt']).day.toString().padLeft(2, '0')}"
                                      : "Invalid date"
                                : "No date",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      // Comments section
                      posts[index]['comments'] != null &&
                              posts[index]['comments'].isNotEmpty
                          ? Column(
                              children: List.generate(
                                posts[index]['comments'].length,
                                (commentIndex) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 18,
                                            backgroundImage: AssetImage(
                                              'assets/student_login.jpg',
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  posts[index]['comments'][commentIndex]['student']['user']['fullName'],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  posts[index]['comments'][commentIndex]['content'],
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "No comments yet. Be the first to comment!",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
