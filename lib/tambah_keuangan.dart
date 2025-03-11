import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Definisi warna tema ungu muda
  static const Color purpleLight = Color(0xFFD8BFD8);
  static const Color purpleMedium = Color(0xFFB19CD9);
  static const Color purpleDark = Color(0xFF9370DB);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: purpleMedium,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: purpleMedium,
          elevation: 0,
          title: const Text(
            'Kategori Pengeluaran',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            // Grid kategori
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 0.85,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: [
                  _buildCategory(Icons.fastfood, "Makan", isSelected: true),
                  _buildCategory(Icons.chair, "Harian"),
                  _buildCategory(Icons.directions_bus, "Transportasi"),
                  _buildCategory(Icons.wine_bar, "Sosial"),
                  _buildCategory(Icons.house, "Perumahan"),
                  _buildCategory(Icons.card_giftcard, "Hadiah"),
                  _buildCategory(Icons.smartphone, "Komunikasi"),
                  _buildCategory(Icons.checkroom, "Pakaian"),
                  _buildCategory(Icons.sunny, "Rekreasi"),
                  _buildCategory(Icons.cut, "Perawatan"),
                  _buildCategory(Icons.medical_services, "Medis"),
                  _buildCategory(Icons.money, "Pajak"),
                  _buildCategory(Icons.school, "Pendidikan"),
                  _buildCategory(Icons.fitness_center, "Olahraga"),
                  _buildCategory(Icons.pets, "Peliharaan"),
                  _buildCategory(Icons.beach_access, "Bepergian"),
                ],
              ),
            ),
            // Kalkulator
            _buildCalculator(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(IconData icon, String label, {bool isSelected = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isSelected ? purpleMedium.withOpacity(0.3) : purpleLight.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            border: isSelected ? Border.all(color: purpleMedium, width: 2) : null,
            boxShadow: isSelected 
                ? [BoxShadow(color: purpleMedium.withOpacity(0.3), blurRadius: 5, offset: const Offset(0, 2))] 
                : null,
          ),
          padding: const EdgeInsets.all(12),
          child: Icon(icon, size: 32, color: isSelected ? purpleDark : Colors.black87),
        ),
        const SizedBox(height: 8),
        Text(
          label, 
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? purpleDark : Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCalculator() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: purpleMedium,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                hintText: "Masukkan jumlah",
                hintStyle: TextStyle(color: Colors.grey[400]),
                suffixText: "IDR",
                suffixStyle: const TextStyle(fontWeight: FontWeight.bold),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 15),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            childAspectRatio: 1.2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildCalcButton("×"),
              _buildCalcButton("7"),
              _buildCalcButton("8"),
              _buildCalcButton("9"),
              _buildCalcButton("÷"),
              _buildCalcButton("4"),
              _buildCalcButton("5"),
              _buildCalcButton("6"),
              _buildCalcButton("−"),
              _buildCalcButton("1"),
              _buildCalcButton("2"),
              _buildCalcButton("3"),
              _buildCalcButton("+"),
              _buildCalcButton("."),
              _buildCalcButton("0"),
              _buildCalcButton("✓", bgColor: purpleDark),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalcButton(String label, {Color bgColor = Colors.white}) {
    final isOperation = label == "×" || label == "÷" || label == "−" || label == "+" || label == "✓";
    
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {},
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold,
                color: isOperation && label != "✓" ? purpleDark : (label == "✓" ? Colors.white : Colors.black87),
              ),
            ),
          ),
        ),
      ),
    );
  }
}