

import 'package:flutter/material.dart';

class SpeedDistancePage extends StatefulWidget {
  const SpeedDistancePage({super.key});

  @override
  State<SpeedDistancePage> createState() => _SpeedDistancePageState();
}

class _SpeedDistancePageState extends State<SpeedDistancePage> {
  double _speed = 0;
  double _time = 0;
  double _distance = 0;

  final TextEditingController _speedController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final InputDecoration _textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.grey[300],
    border: const OutlineInputBorder(),
  );

  void _calculateDistance() {
    _speed = double.tryParse(_speedController.text) ?? 0;
    _time = double.tryParse(_timeController.text) ?? 0;

    setState(() {
      _distance = _speed * _time;
    });
  }

  @override
  void dispose() {
    _speedController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("คำนวณระยะทาง"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // แสดงผลลัพธ์
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "ความเร็ว $_speed km/h × เวลา $_time ชม.\nระยะทาง: $_distance km",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            // ช่องกรอกความเร็ว
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _speedController,
                keyboardType: TextInputType.number,
                decoration: _textFieldStyle.copyWith(
                  labelText: "ความเร็ว (km/h)",
                  hintText: "กรอกความเร็ว เช่น 50",
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ช่องกรอกเวลา
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _timeController,
                keyboardType: TextInputType.number,
                decoration: _textFieldStyle.copyWith(
                  labelText: "เวลา (ชั่วโมง)",
                  hintText: "กรอกเวลา เช่น 2",
                ),
              ),
            ),
            const SizedBox(height: 30),

            // ปุ่มคำนวณ
            ElevatedButton(
              onPressed: _calculateDistance,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text("คำนวณระยะทาง"),
            ),

            const SizedBox(height: 30),

            // ตัวอย่างการใช้งาน
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "ตัวอย่าง:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "ความเร็ว 50 km/h × เวลา 2 ชม. = 100 km",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "ความเร็ว 80 km/h × เวลา 3 ชม. = 240 km",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
