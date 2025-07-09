import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSection extends StatefulWidget {
  CarouselSection({super.key});

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  int currentIndex = 0;
  final List<Map<String, String>> carouselItems = [
    {'image': 'assets/school.png', 'title': 'Learn Math Basics'},
    {'image': 'assets/school.png', 'title': 'Discover Science'},
    {'image': 'assets/school.png', 'title': 'Design Resources'},
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carouselItems.length,
      options: CarouselOptions(
        height: 230.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.85,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      itemBuilder: (context, index, realIndex) {
        final item = carouselItems[index];
        final isActive = index == currentIndex;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  item['image']!,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item['title']!,
                style: TextStyle(
                  fontSize: isActive ? 24 : 16,
                  fontWeight: isActive ? FontWeight.w900 : FontWeight.normal,
                  color: isActive ? Colors.black : Colors.grey[700],
                ),
              ),
            ],
          ),
        );
      },
    );
    // Replace with your actual widget implementation
  }
}
