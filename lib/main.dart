import 'package:flutter/material.dart';
import 'models/workstation_profile.dart';

void main() {
  runApp(const XoDosApp());
}

class XoDosApp extends StatelessWidget {
  const XoDosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XoDos',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepOrange,
        colorScheme: ColorScheme.dark(primary: Colors.deepOrange),
      ),
      home: const XoDosHomePage(),
    );
  }
}

class XoDosHomePage extends StatelessWidget {
  const XoDosHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('XoDos Custom')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('XoDos Ready', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text('Connected Clouds: ${connectedClouds.length}'),
            const SizedBox(height: 10),
            Text('Providers: ${connectedClouds.map((p) => p.providerId).join(", ")}'),
          ],
        ),
      ),
    );
  }
}
