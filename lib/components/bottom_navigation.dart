import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:student_management_system_app/pages/HomePage.dart';
import 'package:student_management_system_app/pages/student_community_page.dart';

class BottomNavigation extends StatefulWidget {
  int selectedIndex;
  BottomNavigation({super.key, required this.selectedIndex});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  void onTabChange(int index) {
    if (widget.selectedIndex == index) return;

    setState(() {
      widget.selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StudentCommunityPage()),
      );
    } else if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
      child: GNav(
        selectedIndex: widget.selectedIndex,
        onTabChange: onTabChange,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        backgroundColor: Colors.blue,
        rippleColor: Colors.white,
        hoverColor: Colors.purple,
        haptic: true,
        tabBorderRadius: 15,
        tabActiveBorder: Border.all(color: Colors.black, width: 1),
        tabBorder: Border.all(color: Colors.grey, width: 1),
        tabShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8),
        ],
        curve: Curves.easeOutExpo,
        duration: Duration(milliseconds: 900),
        gap: 8,
        color: Colors.grey[800],
        activeColor: Colors.white,
        iconSize: 24,
        tabBackgroundColor: Colors.purple.withOpacity(0.1),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tabs: [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.group, text: 'Community'),
        ],
      ),
    );
  }
}
