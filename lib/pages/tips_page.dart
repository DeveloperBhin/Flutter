import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tips = [
      'Use good lighting',
      'Focus on the affected leaf area',
      'Keep the camera steady',
      'Avoid shadows',
      'Capture both healthy and diseased parts',
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tips.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.tips_and_updates),
              title: Text(tips[index]),
            ),
          );
        },
      ),
    );
  }
}