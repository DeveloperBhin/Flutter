/// HomePage - Main screen of PlantDoctor
///
/// This page serves as the main hub of the app where users can:
/// - View instructions on how to use the app
/// - Access the camera to scan plant leaves
/// - Learn about plant disease detection
///
/// Features a FloatingActionButton to launch the camera scanner.

import 'package:flutter/material.dart';

// import 'camera_page.dart';
import 'tips_page.dart';
import 'scan_page.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
late List<Widget> pages;

  @override
  Widget build(BuildContext context) {
      final colorScheme = Theme.of(context).colorScheme;
      final isDark = Theme.of(context).brightness == Brightness.dark;

   
 return Scaffold(
      // appBar: AppBar(title: const Text('TARI Disease Detector')),
         
      body: pages[_index],
     


    );
}





// Widget _buildHomeContent(BuildContext context) {
//   return SafeArea(
//     child: Column(
//       children: [
//         const SizedBox(height: 8),

//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: SizedBox.expand(
//               child: Card(
//                 margin: EdgeInsets.zero,
//                 clipBehavior: Clip.antiAlias,
//                 shape: const RoundedRectangleBorder(
//   borderRadius: BorderRadius.vertical(
//     top: Radius.circular(20),
//     bottom: Radius.circular(0),
//   ),
// ),
//                 child: Stack(
//                   children: [
//                     Positioned.fill(
//                       child: Image.asset(
//                         'assets/images/scan.jpeg',
//                         fit: BoxFit.cover,
//                       ),
//                     ),

//                     Positioned.fill(
//                       child: Container(
//                         color: Colors.green.withOpacity(0.45),
//                       ),
//                     ),

//                     Center(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           _buildInnerCard(
//                             context: context,
//                             image: 'assets/images/avocado.jpeg',
//                             title: 'Avocado',
//                             plantName: 'Avocado',
//                           ),
//                           const SizedBox(height: 20),
//                           _buildInnerCard(
//                             context: context,
//                             image: 'assets/images/cashew.jpeg',
//                             title: 'Cashew',
//                             plantName: 'Cashew',
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

Widget _buildHomeContent(BuildContext context) {
  return SafeArea(
    child: Column(
      children: [
        const SizedBox(height: 8),

        Expanded(
          child: Card(
            margin: EdgeInsets.zero, // FULL WIDTH
            clipBehavior: Clip.antiAlias,
           
    child: Stack(
  children: [
    Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 150,
            height: 150,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.green,
                width: 4,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/app_icon.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            'TARI Disease',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              
              color: Colors.black,
            ),
          ),
           const Text(
            'Detector',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            '"Healthy Plants, Better Harvests"',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
    fontStyle: FontStyle.italic,

              color: Colors.black,
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
    ),
  );
}


  /// Show the about dialog
  
}
