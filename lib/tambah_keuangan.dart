import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TambahPengeluaran(),
  ));
}

class TambahPengeluaran extends StatelessWidget {
  const TambahPengeluaran({super.key});

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
        title: Row(
          children: [
            const SizedBox(width: 8), // Jarak antara ikon dan teks
            const Text(
              'Pengeluaran',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Kembali ke screen sebelumnya
          },
        ),
      ),
        body: Column(
          children: [
            const SizedBox(height: 5),
            // Grid kategori
            Flexible(
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 0.85,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                mainAxisSpacing: 15,
                crossAxisSpacing: 8,
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
            // Kalkulator
            _buildCalculator(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(IconData icon, String label,
      {bool isSelected = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isSelected
                ? purpleMedium.withOpacity(0.3)
                : purpleLight.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            border:
                isSelected ? Border.all(color: purpleMedium, width: 2) : null,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                        color: purpleMedium.withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(0, 2))
                  ]
                : null,
          ),
          padding: const EdgeInsets.all(12),
          child: Icon(icon,
              size: 32, color: isSelected ? purpleDark : Colors.black87),
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
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: purpleMedium,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 7,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintText: "Jumlah",
                hintStyle: TextStyle(color: Colors.grey[400]),
                suffixText: "IDR",
                suffixStyle: const TextStyle(fontWeight: FontWeight.bold),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              ),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            childAspectRatio: 1.5,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
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
    final isOperation =
        label == "×" || label == "÷" || label == "−" || label == "+" || label == "✓";

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isOperation && label != "✓"
                    ? purpleDark
                    : (label == "✓" ? Colors.white : Colors.black87),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
