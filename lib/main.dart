/// TARI Disease Detector - AI-powered Plant Disease Detection App
///
/// This is the main entry point of the application.
/// The app uses Provider for state management and Material 3 for UI design.
///
/// Architecture:
/// - pages/: Contains all screen widgets (SplashPage, HomePage, CameraPage, ResultPage)
/// - services/: Business logic and ML model handling
/// - data/: Data loading utilities
/// - widgets/: Reusable UI components

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import pages
import 'pages/splash_page.dart';

// Import providers (state management)
import 'providers/app_provider.dart';

void main() {
  // Ensure Flutter bindings are initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}

/// Root widget of the TARI Disease Detector application.
///
/// This widget sets up:
/// - Provider for state management across the app
/// - Material 3 theming with a green color scheme (plant-themed)
/// - Initial route to SplashPage
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiProvider allows us to provide multiple state objects to the widget tree
    return MultiProvider(
      providers: [
        // AppProvider manages global app state (model loading status, etc.)
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MaterialApp(
        // App title shown in task switcher
        title: 'TARI Disease Detector',

        // Disable the debug banner in release builds
        debugShowCheckedModeBanner: false,

        // Material 3 theme configuration with plant-themed green colors
        // theme: ThemeData(
        //   // Enable Material 3 design
        //   useMaterial3: true,

        //   // Green color scheme - perfect for a plant app!
        //   colorScheme: ColorScheme.fromSeed(
        //     seedColor: const Color(0xFF11732E), // Green 500
        //     brightness: Brightness.light,
        //   ),

        //   // Card theme for consistent card styling
        //   cardTheme: CardThemeData(
        //     elevation: 2,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(16),
        //     ),
        //   ),

        //   // Elevated button theme
        //   elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(
        //       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(12),
        //       ),
        //     ),
        //   ),

        //   // FloatingActionButton theme
        //   floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //     elevation: 4,
        //     extendedPadding: EdgeInsets.symmetric(horizontal: 24),
        //   ),

        //   // AppBar theme
        //   appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
        // ),

        theme: ThemeData(
  useMaterial3: true,

  colorScheme: const ColorScheme(
    brightness: Brightness.light,

    primary: Color(0xFF11732E), // Accent
    onPrimary: Colors.white,

    secondary: Color(0xFF11732E),
    onSecondary: Colors.white,

    surface: Colors.white, // Cards
    onSurface: Color(0xFF1A1A1A),

    background: Color(0xFFF5F7F6), // App background
    onBackground: Color(0xFF1A1A1A),

    error: Colors.red,
    onError: Colors.white,
  ),
),


        // Dark theme configuration (optional - for system dark mode)
        // darkTheme: ThemeData(
        //   useMaterial3: true,
        //   colorScheme: ColorScheme.fromSeed(
        //     seedColor: const Color(#11732E),
        //     brightness: Brightness.dark,
        //   ),
        // ),

        darkTheme: ThemeData(
  useMaterial3: true,

  colorScheme: const ColorScheme(
    brightness: Brightness.dark,

    primary: Color(0xFF11732E), // Accent
    onPrimary: Colors.white,

    secondary: Color(0xFF11732E),
    onSecondary: Colors.white,

    surface: Color(0xFF123524), // Cards / containers
    onSurface: Colors.white,

    background: Color(0xFF1A1A18), // App background
    onBackground: Colors.white,

    error: Colors.red,
    onError: Colors.white,
  ),
),

        // Use system theme mode (light/dark based on device settings)
        themeMode: ThemeMode.system,

        // Start the app with SplashPage
        home: const SplashPage(),
      ),
    );
  }
}
