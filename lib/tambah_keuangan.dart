import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
      fontFamily: 'Poppins',
    ),
    home: const TambahPengeluaran(),
  ));
}

class TambahPengeluaran extends StatelessWidget {
  const TambahPengeluaran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A148C),
        elevation: 0,
        title: const Text(
          'Pengeluaran',
          style: TextStyle(
            color: Color(0xFFEDE7F6),
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        // Tombol back dihapus
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFEDE7F6),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Grid kategori
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                mainAxisSpacing: 10,
                crossAxisSpacing: 6,
                children: [
                  _buildCategory(Icons.school, "Pendidikan"),
                  _buildCategory(Icons.fastfood, "Makan", isSelected: true),
                  _buildCategory(Icons.chair, "Harian"),
                  _buildCategory(Icons.directions_bus, "Transportasi"),
                  _buildCategory(Icons.wine_bar, "Sosial"),
                  _buildCategory(Icons.fitness_center, "Olahraga"),
                  _buildCategory(Icons.smartphone, "Komunikasi"),
                  _buildCategory(Icons.sunny, "Rekreasi"),
                  _buildCategory(Icons.checkroom, "Pakaian"),
                  _buildCategory(Icons.cut, "Perawatan"),
                  _buildCategory(Icons.medical_services, "Medis"),
                  _buildCategory(Icons.money_sharp, "Pajak"),
                ],
              ),
            ),
            // Kalkulator yang lebih rapat
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
            color: isSelected
                ? const Color(0xFFD1C4E9)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: isSelected 
                ? Border.all(color: const Color(0xFF4A148C), width: 2) 
                : Border.all(color: const Color(0xFFE1E1E1), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(isSelected ? 0.2 : 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Icon(
            icon,
            size: 28,
            color: isSelected ? const Color(0xFF4A148C) : Colors.grey[700],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? const Color(0xFF4A148C) : Colors.grey[800],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCalculator() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12), // Padding atas dikurangi
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.05), // Opacity bayangan dikurangi
            blurRadius: 6, // Blur radius dikurangi
            offset: const Offset(0, -2), // Offset dikurangi
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8), // Margin dikurangi
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: "Jumlah",
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                suffixText: "IDR",
                suffixStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A148C),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Padding dikurangi
              ),
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              keyboardType: TextInputType.number,
            ),
          ),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            childAspectRatio: 1.5, // Rasio yang lebih tinggi membuat tombol lebih pipih
            crossAxisSpacing: 5, // Spasi dikurangi
            mainAxisSpacing: 5, // Spasi dikurangi
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
              _buildCalcButton("✓", bgColor: const Color(0xFF4A148C)),
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
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // Opacity dikurangi
            blurRadius: 1, // Blur radius dikurangi
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {},
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15, // Ukuran font dikurangi
                fontWeight: FontWeight.bold,
                color: isOperation && label != "✓"
                    ? const Color(0xFF4A148C)
                    : (label == "✓" ? Colors.white : Colors.black87),
              ),
            ),
          ),
        ),
      ),
    );
  }
}