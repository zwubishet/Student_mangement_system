import 'package:flutter/material.dart';
import 'package:student_management_system_app/components/Header_Home_page.dart';
import 'package:student_management_system_app/components/Student_status_table.dart';
import 'package:student_management_system_app/components/bottom_navigation.dart';
import 'package:student_management_system_app/components/carousel_Home_page.dart';
import 'package:student_management_system_app/components/complain_request_page.dart';
import 'package:student_management_system_app/components/continer.dart';

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
    return Column(
      children: [
        YearDropdownCards(title: "Year-2024", grade: "Grade 5"),
        SizedBox(height: 10),
        YearDropdownCards(title: "Year-2023", grade: "Grade 4"),
        SizedBox(height: 10),
        YearDropdownCards(title: "year-2022 ", grade: "Grade 3"),
        SizedBox(height: 10),
        YearDropdownCards(title: "Year-2021", grade: "Grade 2"),
        SizedBox(height: 10),
        YearDropdownCards(title: "Year-2020", grade: "Grade 1"),
      ],
    );
  }
}
