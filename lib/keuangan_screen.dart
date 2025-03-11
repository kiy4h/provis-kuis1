import 'package:flutter/material.dart';
import 'package:kuis/tambah_keuangan.dart';

void main() {
  runApp(MaterialApp(
    home: KeuanganScreen(),
  ));
}

class KeuanganScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keuangan"),
        backgroundColor: Color(0xFF6C63FF),
        leading: IconButton( // Tambah tombol back
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Column(
        children: [
          _buildSummaryCard(),
          Expanded(child: _buildTransactionList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF6C63FF),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahPengeluaran()),
          );
        },
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("23/2/2025 - 1/3/2025",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryItem("Total", "Rp245,000", Colors.green),
                _buildSummaryItem("Penghasilan", "Rp450,000", Colors.green),
                _buildSummaryItem("Pengeluaran", "Rp205,000", Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String title, String amount, Color color) {
    return Column(
      children: [
        Text(amount,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: color)),
        Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildTransactionList() {
    List<Map<String, dynamic>> transactions = [
      {"date": "Sab, 1/3", "title": "Pendidikan", "amount": "-Rp75,000", "subtitle": "Buku kuliah", "icon": Icons.school, "color": Colors.red},
      {"date": "Sab, 1/3", "title": "Pemasukan", "amount": "+Rp450,000", "subtitle": "Pendapatan bulanan", "icon": Icons.attach_money, "color": Colors.green},
      {"date": "Jum, 28/2", "title": "Transportasi", "amount": "-Rp35,000", "subtitle": "Bensin", "icon": Icons.directions_bus, "color": Colors.red},
      {"date": "Kam, 27/2", "title": "Perawatan", "amount": "-Rp50,000", "subtitle": "Potong rambut", "icon": Icons.cut, "color": Colors.red},
      {"date": "Kam, 27/2", "title": "Sosial", "amount": "-Rp45,000", "subtitle": "Kopi dengan teman", "icon": Icons.wine_bar, "color": Colors.red},
    ];

    String? lastDate;

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: transactions.expand((transaction) {
        List<Widget> widgets = [];

        if (lastDate != transaction["date"]) {
          widgets.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                transaction["date"],
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
          );
          lastDate = transaction["date"];
        }

        widgets.add(_buildTransactionItem(
          transaction["title"],
          transaction["amount"],
          transaction["subtitle"],
          transaction["icon"],
          transaction["color"],
        ));

        return widgets;
      }).toList(),
    );
  }

  Widget _buildTransactionItem(String title, String amount,
      String subtitle, IconData icon, Color amountColor) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(icon, color: Colors.purple),
        ),
        title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Text(amount,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: amountColor)),
      ),
    );
  }
}
