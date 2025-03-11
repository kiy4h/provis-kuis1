import 'package:flutter/material.dart';

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
      ),
      body: Column(
        children: [
          _buildSummaryCard(),
          Expanded(child: _buildTransactionList()),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF6C63FF),
        child: Icon(Icons.add),
        onPressed: () {},
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
    {"date": "Sab, 1/3", "title": "Makan", "amount": "-Rp50,000", "subtitle": "Diri sendiri", "icon": Icons.fastfood, "color": Colors.red},
    {"date": "Sab, 1/3", "title": "Uang", "amount": "+Rp450,000", "subtitle": "Diri sendiri", "icon": Icons.attach_money, "color": Colors.green},
    {"date": "Jum, 28/2", "title": "Makan", "amount": "-Rp28,000", "subtitle": "Diri sendiri", "icon": Icons.fastfood, "color": Colors.red},
    {"date": "Kam, 27/2", "title": "Makan", "amount": "-Rp59,000", "subtitle": "Diri sendiri", "icon": Icons.fastfood, "color": Colors.red},
  ];

  String? lastDate; // Menyimpan tanggal terakhir untuk membandingkan

  return ListView(
    padding: EdgeInsets.symmetric(horizontal: 16),
    children: transactions.expand((transaction) {
      List<Widget> widgets = [];

      // Jika tanggal berubah, tampilkan sebagai header
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
        lastDate = transaction["date"]; // Update lastDate
      }

      // Tambahkan transaksi sebagai ListTile
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



  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: Color(0xFF6C63FF),
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.book), label: "Buku"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet), label: "Dompet"),
        BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: "Analisis"),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "Lebih"),
      ],
    );
  }
}