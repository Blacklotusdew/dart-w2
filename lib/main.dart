import 'package:flutter/material.dart';
import 'dew.dart'; // เปลี่ยนจาก rectangle_page.dart
import 'rectangle_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/speed_distance': (context) => const RectanglePage(), // เปลี่ยน route
        '/dw': (context) => const SpeedDistancePage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cal")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ปุ่มที่ 1 - คำนวณระยะทาง
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/speed_distance'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text("คำนวณสี่เหลี่ยม"),
            ),
            const SizedBox(height: 15),

            // ปุ่มที่ 2 - แปลงนิ้วเป็นซม.
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/dw'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text("คำนวณระยะ"),
            ),
          ],
        ),
      ),
    );
  }
}