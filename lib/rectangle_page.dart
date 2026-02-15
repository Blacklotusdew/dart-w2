import 'package:flutter/material.dart';

class RectanglePage extends StatefulWidget {
  const RectanglePage({super.key});

  @override
  State<RectanglePage> createState() => RectanglePageState();
}

class RectanglePageState extends State<RectanglePage> {

  double _width = 0;
  double _length = 0;
  double _area = 0;

  TextEditingController _widthCtrl = TextEditingController();
  TextEditingController _lengthCtrl = TextEditingController();


  final InputDecoration _textFiedStyle = InputDecoration(
    filled: true,
    fillColor: Colors.grey[300],
    border: OutlineInputBorder(),
  );


  void _calRectangle() {

    _width = double.tryParse(_widthCtrl.text) ?? 0;
    _length = double.tryParse(_lengthCtrl.text) ?? 0;

    setState(() {
      _area = _width * _length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("คำนวณพื้นที่สี่เหลี่ยม"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "กว้าง $_width x ยาว $_length\nพื้นที่คือ: $_area ตร.ม.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _widthCtrl, // เชื่อมตัวควบคุม
                keyboardType: TextInputType.number, // บังคับคีย์บอร์ดตัวเลข
                decoration: _textFiedStyle.copyWith(
                  label: Text("ความกว้าง"),
                  hint: Text("กรอกความกว้าง"),
                ),
              ),
            ),

            SizedBox(height: 20),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _lengthCtrl,
                keyboardType: TextInputType.number,
                decoration: _textFiedStyle.copyWith(
                  label: Text("ความยาว"),
                  hint: Text("กรอกความยาว"),
                ),
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () => _calRectangle(),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 18)
              ),
              child: Text("คำนวณพื้นที่"),
            ),
          ],
        ),
      ),
    );
  }
}