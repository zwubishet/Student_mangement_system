import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({super.key});

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  int currentIndex = 0;
  static List<Map<String, dynamic>> carouselItems = [];

  Future<void> fetchResources() async {
    final response = await http.get(
      Uri.parse("http://localhost:3000/api/resource"),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      setState(() {
        carouselItems = data.map<Map<String, dynamic>>((item) {
          return {
            'title': item['title'],
            'fileUrl': item['file'],
            'link': item['link'],
            'type': item['file'] != null ? 'file' : 'link',
          };
        }).toList();
      });
    } else {
      print("Failed to fetch resources: ${response.statusCode}");
    }
  }

  Future<void> _handleResourceTap(Map<String, dynamic> resource) async {
    if (resource['type'] == 'link') {
      final url = resource['link'];
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        print("Could not launch $url");
      }
    } else if (resource['type'] == 'file') {
      final url = resource['fileUrl'];
      final filename = url.split('/').last;
      final dir = await getTemporaryDirectory();
      final filePath = "${dir.path}/$filename";

      try {
        await Dio().download(url, filePath);
        await OpenFilex.open(filePath);
      } catch (e) {
        print("Error opening file: $e");
      }
    }
  }

  Widget _buildResourceImage(Map<String, dynamic> item) {
    if (item['type'] == 'link' && item['link'].toString().contains("youtube")) {
      final videoId = Uri.parse(item['link']).queryParameters['v'];
      return Image.network(
        "https://img.youtube.com/vi/$videoId/0.jpg",
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            Image.asset('assets/link_icon.png', fit: BoxFit.cover),
      );
    } else if (item['type'] == 'file') {
      return Image.asset(
        'assets/pdf_icon.png', // Replace with your PDF or document icon
        fit: BoxFit.contain,
      );
    } else {
      return Image.asset(
        'assets/link_icon.png', // Generic fallback
        fit: BoxFit.cover,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchResources();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carouselItems.length,
      options: CarouselOptions(
        height: 240.0,
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
          child: GestureDetector(
            onTap: () => _handleResourceTap(item),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 160,
                        width: double.infinity,
                        child: _buildResourceImage(item),
                      ),
                      if (item['type'] == 'file')
                        Positioned(
                          top: 8,
                          right: 8,
                          child: IconButton(
                            icon: const Icon(
                              Icons.download,
                              color: Colors.white,
                            ),
                            onPressed: () => _handleResourceTap(item),
                          ),
                        ),
                      if (item['type'] == 'link' &&
                          item['link'].toString().contains("youtube"))
                        const Positioned.fill(
                          child: Center(
                            child: Icon(
                              Icons.play_circle_fill,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item['type'] == 'link'
                            ? Icons.link
                            : Icons.insert_drive_file,
                        color: Colors.grey[600],
                        size: isActive ? 22 : 18,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        item['title'] ?? '',
                        style: TextStyle(
                          fontSize: isActive ? 20 : 16,
                          fontWeight: isActive
                              ? FontWeight.w700
                              : FontWeight.normal,
                          color: isActive ? Colors.black : Colors.grey[700],
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
    );
  }
}
