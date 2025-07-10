import 'package:flutter/material.dart';

class ResourcePage extends StatelessWidget {
  final List resources;
  final int currentIndex;

  const ResourcePage({
    super.key,
    required this.resources,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    // Move currentIndex item to the front
    final reorderedResources = [
      resources[currentIndex],
      ...resources
          .asMap()
          .entries
          .where((entry) => entry.key != currentIndex)
          .map((entry) => entry.value),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Dream Primary',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w800,
            shadows: [
              Shadow(
                color: Colors.white.withOpacity(0.5),
                offset: Offset(2, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: reorderedResources.length,
        itemBuilder: (context, index) {
          final resource = reorderedResources[index];
          return ResourceCard(
            image: resource['image'],
            title: resource['title'],
            description: resource['description'],
          );
        },
      ),
    );
  }
}

class ResourceCard extends StatefulWidget {
  final String image;
  final String title;
  final String description;

  const ResourceCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  State<ResourceCard> createState() => _ResourceCardState();
}

class _ResourceCardState extends State<ResourceCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            widget.image,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.black,
              shadows: [
                Shadow(
                  color: Colors.white.withOpacity(0.5),
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: Text(
              widget.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            secondChild: Text(widget.description),
          ),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Text(_isExpanded ? 'Less' : 'More'),
            ),
          ),
        ],
      ),
    );
  }
}
