import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: Colors.grey[100],
    ),
    home: const KeuanganScreen(),
  ));
}

class KeuanganScreen extends StatelessWidget {
  const KeuanganScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A148C), // Deep purple
        elevation: 0,
        title: const Text(
          'Keuangan',
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
      ),
      body: const TransactionListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF4A148C),
        child: const Icon(Icons.add, color: Color(0xFFEDE7F6)),
        onPressed: () {
          // Button kept, but no navigation
        },
      ),
    );
  }
}

class TransactionListView extends StatelessWidget {
  const TransactionListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> transactions = [
      {"date": "Sab, 1/3", "title": "Pendidikan", "amount": "-Rp75,000", "subtitle": "Buku kuliah", "icon": Icons.school, "color": Colors.red},
      {"date": "Sab, 1/3", "title": "Pemasukan", "amount": "+Rp450,000", "subtitle": "Pendapatan bulanan", "icon": Icons.attach_money, "color": Colors.green},
      {"date": "Jum, 28/2", "title": "Transportasi", "amount": "-Rp35,000", "subtitle": "Bensin", "icon": Icons.directions_bus, "color": Colors.red},
      {"date": "Kam, 27/2", "title": "Perawatan", "amount": "-Rp50,000", "subtitle": "Potong rambut", "icon": Icons.cut, "color": Colors.red},
      {"date": "Kam, 27/2", "title": "Sosial", "amount": "-Rp45,000", "subtitle": "Kopi dengan teman", "icon": Icons.wine_bar, "color": Colors.red},
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFEDE7F6), // Very light purple
            Colors.white,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "23/2/2025 - 1/3/2025",
                    style: TextStyle(
                      fontSize: 14, 
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A148C),
                    )
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildSummaryItem('Total', 'Rp245,000', Icons.account_balance_wallet, Colors.blue),
                      _buildSummaryItem('Penghasilan', 'Rp450,000', Icons.trending_up, Colors.green),
                      _buildSummaryItem('Pengeluaran', 'Rp205,000', Icons.trending_down, Colors.red),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: const Text(
                'Riwayat Transaksi',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A148C),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Transactions list
            Expanded(
              child: _buildTransactionList(transactions),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String title, String value, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFD1C4E9),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 20,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          title,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionList(List<Map<String, dynamic>> transactions) {
    String? lastDate;

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: transactions.expand((transaction) {
        List<Widget> widgets = [];

        if (lastDate != transaction["date"]) {
          widgets.add(
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 4.0),
              child: Text(
                transaction["date"],
                style: TextStyle(
                  fontSize: 13, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.grey[700]
                ),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            splashColor: Colors.purple.withOpacity(0.1),
            highlightColor: Colors.purple.withOpacity(0.05),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE7F6),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      color: const Color(0xFF673AB7),
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF212121),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    amount,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: amountColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}