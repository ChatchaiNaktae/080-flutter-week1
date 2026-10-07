import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const BMICalculatorApp());
}

// Widget หลักของแอป กำหนดธีมและเปิดใช้งาน Material 3
class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'คำนวณ BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const BMIScreen(),
    );
  }
}

// หน้าจอหลักของแอป ใช้ StatefulWidget เพื่อจัดการค่าที่เปลี่ยนไปมาได้
class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  // ตัวควบคุมข้อความในช่องกรอก
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  // ตัวแปรสำหรับเก็บค่าผลลัพธ์
  double? _bmiResult;
  String _category = '';
  String _advice = '';
  Color _cardColor = Colors.transparent;

  @override
  void dispose() {
    // คืนหน่วยความจำของ Controller เมื่อ Widget ถูกทำลาย
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  // ฟังก์ชันแสดง SnackBar เมื่อเกิดข้อผิดพลาดในการกรอกข้อมูล
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // ฟังก์ชันคำนวณค่า BMI และประเมินผล
  void _calculateBMI() {
    final String weightText = _weightController.text.trim();
    final String heightText = _heightController.text.trim();

    // ตรวจสอบช่องว่าง
    if (weightText.isEmpty || heightText.isEmpty) {
      _showErrorSnackBar('กรุณากรอกทั้งน้ำหนักและส่วนสูง');
      return;
    }

    // แปลงข้อความเป็นตัวเลขทศนิยม
    final double? weight = double.tryParse(weightText);
    final double? heightCm = double.tryParse(heightText);

    // ตรวจสอบความถูกต้องของตัวเลข
    if (weight == null || heightCm == null) {
      _showErrorSnackBar('กรุณากรอกข้อมูลเป็นตัวเลขเท่านั้น');
      return;
    }

    // ตรวจสอบค่าต้องมากกว่า 0
    if (weight <= 0 || heightCm <= 0) {
      _showErrorSnackBar('น้ำหนักและส่วนสูงต้องมีค่ามากกว่า 0');
      return;
    }

    // คำนวณ BMI = น้ำหนัก (กก.) ÷ (ส่วนสูง (ม.))²
    final double heightM = heightCm / 100.0;
    final double bmi = weight / (heightM * heightM);

    String categoryText = '';
    String adviceText = '';
    Color color = Colors.grey;

    // เกณฑ์การแปลผลสำหรับคนเอเชีย
    if (bmi < 18.5) {
      categoryText = 'ผอม';
      adviceText = 'น้ำหนักต่ำกว่าเกณฑ์ ควรรับประทานอาหารให้ครบ 5 หมู่และเพิ่มพลังงานอย่างเหมาะสม';
      color = Colors.lightBlue.shade100;
    } else if (bmi < 23.0) {
      categoryText = 'ปกติ';
      adviceText = 'น้ำหนักอยู่ในเกณฑ์มาตรฐาน ควรรักษาพฤติกรรมการกินและการออกกำลังกายสม่ำเสมอ';
      color = Colors.green.shade100;
    } else if (bmi < 25.0) {
      categoryText = 'ท้วม';
      adviceText = 'น้ำหนักเกินเกณฑ์เล็กน้อย ควรเริ่มควบคุมอาหารหวาน มัน เค็ม และออกกำลังกาย';
      color = Colors.amber.shade100;
    } else if (bmi < 30.0) {
      categoryText = 'อ้วน';
      adviceText = 'อยู่ในเกณฑ์อ้วนระดับ 1 ควรปรับเปลี่ยนพฤติกรรมการรับประทานอาหารและออกกำลังกายจริงจัง';
      color = Colors.orange.shade100;
    } else {
      categoryText = 'อ้วนมาก';
      adviceText = 'อยู่ในเกณฑ์อ้วนอันตราย มีความเสี่ยงต่อโรคเรื้อรัง ควรปรึกษาแพทย์หรือผู้เชี่ยวชาญด้านสุขภาพ';
      color = Colors.red.shade100;
    }

    // อัปเดตสถานะของหน้าจอเพื่อเรนเดอร์ผลลัพธ์
    setState(() {
      _bmiResult = bmi;
      _category = categoryText;
      _advice = adviceText;
      _cardColor = color;
    });

    // ซ่อนคีย์บอร์ดลงหลังคำนวณ
    FocusScope.of(context).unfocus();
  }

  // ฟังก์ชันล้างค่าทั้งหมดกลับสู่เริ่มต้น
  void _clearValues() {
    setState(() {
      _weightController.clear();
      _heightController.clear();
      _bmiResult = null;
      _category = '';
      _advice = '';
      _cardColor = Colors.transparent;
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('คำนวณ BMI'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // ใช้ SingleChildScrollView ป้องกันหน้าจอล้นเวลาคีย์บอร์ดเปิดขึ้นมา
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ช่องกรอกน้ำหนัก
            TextField(
              controller: _weightController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              decoration: const InputDecoration(
                labelText: 'น้ำหนัก (กก.)',
                hintText: 'ตัวอย่าง: 65.5',
                prefixIcon: Icon(Icons.monitor_weight_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // ช่องกรอกส่วนสูง
            TextField(
              controller: _heightController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              decoration: const InputDecoration(
                labelText: 'ส่วนสูง (ซม.)',
                hintText: 'ตัวอย่าง: 170',
                prefixIcon: Icon(Icons.height_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            // ปุ่มกด คำนวณ และ ล้างค่า
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _calculateBMI,
                    icon: const Icon(Icons.calculate_outlined),
                    label: const Text('คำนวณ'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _clearValues,
                    icon: const Icon(Icons.refresh_outlined),
                    label: const Text('ล้างค่า'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // การ์ดแสดงผลลัพธ์ (จะแสดงเมื่อมีค่า _bmiResult)
            if (_bmiResult != null)
              Card(
                color: _cardColor,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'ค่า BMI ของคุณ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // แสดงค่า BMI ทศนิยม 2 ตำแหน่ง
                      Text(
                        _bmiResult!.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      // แสดงการแปลผล
                      Text(
                        'ระดับ: $_category',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(height: 24, thickness: 1),
                      // แสดงคำแนะนำ
                      Text(
                        _advice,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}