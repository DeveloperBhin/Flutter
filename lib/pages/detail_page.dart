import 'package:flutter/material.dart';

class PlantDetailPage extends StatelessWidget {
  final String plantName;
  final String image;

  const PlantDetailPage({
    super.key,
    required this.plantName,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(plantName),
        backgroundColor: colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              // ================= ROW 1 =================
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    // IMAGE
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 20),

                    // NAME
                    Expanded(
                      child: Text(
                        plantName,
                        style: textTheme.titleLarge?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ================= ROW 2 =================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Common Diseases",
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "• Leaf spot\n"
                      "• Root rot\n"
                      "• Anthracnose\n"
                      "• Bacterial blight",
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}