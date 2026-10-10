import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/profile_list_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: NadaApp(),
    ),
  );
}

class NadaApp extends StatelessWidget {
  const NadaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nada',
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      home: const ProfileListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}