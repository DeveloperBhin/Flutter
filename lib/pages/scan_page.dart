// import 'package:flutter/material.dart';

// class ScanPage extends StatelessWidget {
//   const ScanPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text(
//           'Scan Coming Soon',
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }
// }


/// HomePage - Main screen of PlantDoctor
///
/// This page serves as the main hub of the app where users can:
/// - View instructions on how to use the app
/// - Access the camera to scan plant leaves
/// - Learn about plant disease detection
///
/// Features a FloatingActionButton to launch the camera scanner.

import 'package:flutter/material.dart';

import 'camera_page.dart';
import 'tips_page.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  int _index = 0;
late List<Widget> pages;

  @override
  Widget build(BuildContext context) {
      final colorScheme = Theme.of(context).colorScheme;
      final isDark = Theme.of(context).brightness == Brightness.dark;

    pages = [
      _buildHomeContent(context),
      const CameraPage(),
      const TipsPage(),
    ];
 return Scaffold(
      // appBar: AppBar(title: const Text('TARI Disease Detector')),
      
      body: pages[_index],
     
//  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

// floatingActionButton: FloatingActionButton(
//   backgroundColor: Colors.green,
//   onPressed: () {
//     setState(() => _index = 1); 
//   },
//   child: const Icon(Icons.camera_alt),
// ),

// bottomNavigationBar: BottomAppBar(
//   height: 40,
//   shape: const CircularNotchedRectangle(),
//   notchMargin: 8,
//   color: isDark ? Colors.white : const Color(0xFF035C1D),

//   child: Padding(
//     padding: const EdgeInsets.only(bottom: 0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         IconButton(
//           padding: EdgeInsets.zero,
//           constraints: const BoxConstraints(),
//           icon: Icon(
//             Icons.home,
//             color: _index == 0
//                 ? (isDark ? Colors.green : Colors.white)
//                 : Colors.grey,
//           ),
//           onPressed: () => setState(() => _index = 0),
//         ),

//         IconButton(
//           padding: EdgeInsets.zero,
//           constraints: const BoxConstraints(),
//           icon: Icon(
//             Icons.tips_and_updates,
//             color: _index == 2
//                 ? (isDark ? Colors.green : Colors.white)
//                 : Colors.grey,
//           ),
//           onPressed: () => setState(() => _index = 2),
//         ),
//       ],
//     ),
//   ),
// ),




   // Floating action button to start scanning
    floatingActionButton: Transform.translate(
  offset: const Offset(0, -20), 
  child: FloatingActionButton.extended(
    onPressed: () => _navigateToCamera(context),
    icon: const Icon(Icons.document_scanner),
    label: const Text('Scan Leaf'),
  ),
),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    
    );
}

Widget _buildHomeContent(BuildContext context) {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;

  return SafeArea(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildWelcomeCard(context),
          const SizedBox(height: 80),

          Text(
            'How to Use',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            children: [
              _buildInstructionCard(
                context,
                icon: Icons.camera_alt,
                title: 'Capture',
                description: 'Take a clear photo of the plant leaf.',
              ),
              _buildInstructionCard(
                context,
                icon: Icons.psychology,
                title: 'Analyze',
                description: 'AI analyzes the image for diseases.',
              ),
              _buildInstructionCard(
                context,
                icon: Icons.article,
                title: 'Results',
                description: 'View diagnosis and recommendations.',
              ),
            ],
          ),

          const SizedBox(height: 24),

          Text(
            'Tips for Best Results',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          _buildTipsList(context),

          const SizedBox(height: 80),
        ],
      ),
    ),
  );
}

  /// Build the welcome card at the top of the page
  Widget _buildWelcomeCard(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;




return LayoutBuilder(
  builder: (context, constraints) {
    return Stack(
      clipBehavior: Clip.none,
      children: [

        // BACK IMAGE (matches card width)
        // Positioned(
        //     offset: const Offset(0, 40), // + down, - up


        //   child: SizedBox(

        //     width: constraints.maxWidth,
        //     child: Image.asset(
        //       'assets/images/scan.jpeg',
        //       fit: BoxFit.fitWidth,
        //       alignment: Alignment.bottomCenter,
        //     ),
        //   ),
        // ),
        Transform.translate(
  offset: const Offset(0, 80),
  child: SizedBox(
    width: constraints.maxWidth,
    height: 180,

  
     child: ClipRRect(
  borderRadius: BorderRadius.circular(16),
  child: Image.asset(
    'assets/images/scan.jpeg',
    fit: BoxFit.cover,
    filterQuality: FilterQuality.high,
  ),
),
  ),
),


        // FRONT CARD
        Card(
          color: colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/app_icon.png',
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to TARI Disease Detector',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Detect plant diseases instantly using AI',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onPrimaryContainer.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  },
);
    
  }

  /// Build an instruction card with icon, title, and description
  // Widget _buildInstructionCard(
  //   BuildContext context, {
  //   required IconData icon,
  //   required String title,
  //   required String description,
  // }) 
  Widget _buildInstructionCard(
  BuildContext context, {
  required IconData icon,
  required String title,
  required String description,
}) {
  final theme = Theme.of(context);

  return Card(
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    ),
  );
}
// {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Icon container
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: colorScheme.secondaryContainer,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(
//                 icon,
//                 size: 24,
//                 color: colorScheme.onSecondaryContainer,
//               ),
//             ),

//             const SizedBox(width: 16),

//             // Text content
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: theme.textTheme.titleSmall?.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     description,
//                     style: theme.textTheme.bodyMedium?.copyWith(
//                       color: colorScheme.onSurfaceVariant,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

  /// Build the tips list
  Widget _buildTipsList(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final tips = [
      'Use good lighting (natural daylight works best)',
      'Focus on the affected area of the leaf',
      'Keep the camera steady while capturing',
      'Avoid shadows and reflections on the leaf',
      'Include both healthy and diseased parts if possible',
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: tips
              .map(
                (tip) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 20,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(tip, style: theme.textTheme.bodyMedium),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  /// Navigate to the camera page
  void _navigateToCamera(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const CameraPage()));
  }

  /// Show the about dialog
  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/app_icon.png',
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            const Text('About'),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tari Disease Detector uses artificial intelligence to detect plant diseases from leaf images.',
            ),
            SizedBox(height: 16),
            Text(
              'Version 1.0.0',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '• Works 100% offline\n'
              '• Supports 38 plant diseases\n'
              '• Fast AI inference',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
