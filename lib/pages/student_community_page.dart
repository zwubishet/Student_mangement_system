import 'package:flutter/material.dart';
import 'package:student_management_system_app/components/bottom_navigation.dart';

class StudentCommunityPage extends StatelessWidget {
  StudentCommunityPage({super.key});

  var postes = [
    {
      "title": "Welcome to the Student Community",
      "content":
          "This is a space for students to connect, share ideas, and collaborate",
      "author": "Admin",
      "date": "2024-01-01",
      "image": "assets/school.png",
    },
    {
      "title": "Upcoming Events",
      "content": "Join us for the annual sports day on March 15th!",
      "author": "Event Coordinator",
      "date": "2024-02-20",
      "image": "assets/school.png",
    },
    {
      "title": "Study Group Formation",
      "content":
          "Looking for study partners for the upcoming exams. Let's form groups!",
      "author": "Student A",
      "date": "2024-03-05",
      "image": "assets/school.png",
    },
  ];

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
                shadows: [
                  Shadow(
                    color: Colors.white,
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/student_login.jpg'),
                ),
                SizedBox(width: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "What's in your mind?",
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(postes.length, (index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postes[index]['title'] ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(postes[index]['content'] ?? ''),
                      SizedBox(height: 10),
                      Image.asset(
                        postes[index]['image'] ?? 'assets/school.png',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.thumb_up, size: 16),
                              SizedBox(width: 5),
                              Text('Like'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(postes[index]['author'] ?? ''),
                              Text(postes[index]['date'] ?? ''),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex: 1),
    );
  }
}
