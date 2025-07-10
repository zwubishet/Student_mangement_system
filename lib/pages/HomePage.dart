import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:student_management_system_app/components/Header_Home_page.dart';
import 'package:student_management_system_app/components/Student_status_table.dart';
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
          // Scrollable content with padding for header height
          Padding(
            padding: const EdgeInsets.only(top: 120.0), // Adjust header height
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 100),
                  CarouselSection(),
                  StudentStatusTable(),
                  SizedBox(height: 20),
                  DropdownCards(),
                  SizedBox(height: 100), // Space for FAB
                ],
              ),
            ),
          ),

          // Fixed Header
          const Positioned(top: 0, left: 0, right: 0, child: HeaderSection()),

          // Fixed Floating Ask Button (Bottom right)
          Positioned(bottom: 65, right: 16, child: FloatingAskButton()),
          Positioned(bottom: 0, right: 0, left: 0, child: BottomNavigation()),
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
    ); // Replace with your actual widget implementation
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        backgroundColor: Colors.blue,
        rippleColor: Colors.white, // tab button ripple color when pressed
        hoverColor: Colors.purple, // tab button hover color
        haptic: true, // haptic feedback
        tabBorderRadius: 15,
        tabActiveBorder: Border.all(
          color: Colors.black,
          width: 1,
        ), // tab button border
        tabBorder: Border.all(
          color: Colors.grey,
          width: 1,
        ), // tab button border
        tabShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8),
        ], // tab button shadow
        curve: Curves.easeOutExpo, // tab animation curves
        duration: Duration(milliseconds: 900), // tab animation duration
        gap: 8, // the tab button gap between icon and text
        color: Colors.grey[800], // unselected icon color
        activeColor: Colors.white, // selected icon and text color
        iconSize: 24, // tab button icon size
        tabBackgroundColor: Colors.purple.withOpacity(
          0.1,
        ), // selected tab background color
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ), // navigation bar padding
        tabs: [
          GButton(icon: Icons.home, text: 'Home', onPressed: () {}),
          GButton(icon: Icons.group, text: 'Community', onPressed: () {}),
        ],
      ),
    );
  }
}
