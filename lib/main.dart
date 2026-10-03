import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LumioApp());
}

class LumioApp extends StatelessWidget {
  const LumioApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme;
    try {
      theme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      );
    } catch (e) {
      theme = ThemeData.fallback();
    }

    Widget homeWidget;
    try {
      homeWidget = const HomeScreen();
    } catch (e) {
      homeWidget = Scaffold(
        body: Center(
          child: Text('Error initializing home screen: $e'),
        ),
      );
    }

    return MaterialApp(
      title: 'Lumio',
      theme: theme,
      home: homeWidget,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lumio'),
      ),
      body: const Center(
        child: Text('Welcome to Lumio!'),
      ),
    );
  }
}
