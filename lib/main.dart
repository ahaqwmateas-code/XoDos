import 'package:flutter/material.dart';
import 'screens/server_list_screen.dart';

void main() => runApp(const XodosApp());

class XodosApp extends StatelessWidget {
  const XodosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XoDos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF87CEEB), // Light blue
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF87CEEB),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF5DADE2),
        ),
        cardTheme: CardTheme(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      home: const ServerListScreen(),
    );
  }
}
