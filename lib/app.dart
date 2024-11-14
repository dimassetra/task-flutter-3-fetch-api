import 'package:flutter/material.dart';
import 'package:flutter_user_list_cubit/user_list/user_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feed App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey, // Updated primary color to Blue Grey
        scaffoldBackgroundColor: Colors.blueGrey.shade50, // Lighter Blue Grey for background
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF1E2A47), // Dark Blue for app bar
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color(0xFF00B0FF), // Light Blue for FAB
        ),
      ),
      home: const UserListPage(),
    );
  }
}
