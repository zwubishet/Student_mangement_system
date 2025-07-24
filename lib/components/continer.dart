import 'package:flutter/material.dart';
import 'package:student_management_system_app/pages/semester_result.dart';

class YearDropdownCards extends StatefulWidget {
  final String title;
  final String grade;
  const YearDropdownCards({
    super.key,
    required this.title,
    required this.grade,
  });

  @override
  State<YearDropdownCards> createState() => _YearDropdownCardsState();
}

class _YearDropdownCardsState extends State<YearDropdownCards> {
  bool _isExpanded = false;

  final List<String> semesters = [
    'First Semester',
    'Second Semester',
    'Average',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[600],
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.grade,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),
                        onPressed: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Column(
                  children: semesters
                      .map(
                        (semester) => ListTile(
                          leading: const Icon(Icons.school),
                          title: Text(
                            semester,
                            style: const TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            if (semester == "First Semester") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SemesterResultPage(
                                    year: widget.title,
                                    semester: "1",
                                  ),
                                ),
                              );
                            } else if (semester == "Second Semester") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SemesterResultPage(
                                    year: widget.title,
                                    semester: "2",
                                  ),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SemesterResultPage(
                                    year: widget.title,
                                    semester: "3",
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
