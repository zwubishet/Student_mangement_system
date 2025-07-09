import 'package:flutter/material.dart';
import 'package:student_management_system_app/components/Header_Home_page.dart';
import 'package:student_management_system_app/components/Student_status_table.dart';
import 'package:student_management_system_app/components/carousel_Home_page.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderSection(),
            const SizedBox(height: 20),
            CarouselSection(),
            const StudentStatusTable(),
            const SizedBox(height: 20),
            const DropdownCards(),
            const FloatingAskButton(), // Optionally use a FloatingActionButton
          ],
        ),
      ),
    );
  }
}

class FloatingAskButton extends StatelessWidget {
  const FloatingAskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(); // Replace with your actual widget implementation
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
    ); // Replace with your actual widget implementation
  }
}
