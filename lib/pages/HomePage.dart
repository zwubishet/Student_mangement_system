import 'package:flutter/material.dart';
import 'package:student_management_system_app/components/Header_Home_page.dart';
import 'package:student_management_system_app/components/Student_status_table.dart';
import 'package:student_management_system_app/components/bottom_navigation.dart';
import 'package:student_management_system_app/components/carousel_Home_page.dart';
import 'package:student_management_system_app/components/complain_request_page.dart';
import 'package:student_management_system_app/components/continer.dart';
import 'package:student_management_system_app/services/getStudentData.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 100),
                  CarouselSection(),
                  StudentStatusTable(),
                  SizedBox(height: 20),
                  DropdownCards(),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),

          const Positioned(top: 0, left: 0, right: 0, child: HeaderSection()),
          Positioned(bottom: 65, right: 16, child: FloatingAskButton()),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: BottomNavigation(selectedIndex: 0),
          ),
        ],
      ),
    );
  }
}

class DropdownCards extends StatelessWidget {
  const DropdownCards({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: studentGrade(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading data'));
        } else {
          final data = snapshot.data!;
          if (data.isEmpty) {
            return const Center(child: Text("No grades available"));
          }

          // Extract unique years
          final uniqueYears = data.map((item) => item['year']).toSet().toList()
            ..sort((a, b) => b.compareTo(a)); // Optional: descending order

          return ListView.builder(
            itemCount: uniqueYears.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final year = uniqueYears[index];

              return Column(
                children: [
                  YearDropdownCards(
                    title: year.toString(),
                    grade: "Grade 5", // Change if dynamic
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          );
        }
      },
    );
  }
}
