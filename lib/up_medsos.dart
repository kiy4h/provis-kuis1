import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF4A148C),
        fontFamily: 'Poppins',
      ),
      home: UpMedsos(),
    ),
  );
}

class UpMedsos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4A148C),
        elevation: 0,
        title: Text(
          "Tambah Konten",
          style: TextStyle(
            color: Color(0xFFEDE7F6),
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        // Menghapus tombol back dengan mengosongkan leading property
        leading: Container(),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            // Membuat tombol simpan lebih ramping
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            alignment: Alignment.center,
            constraints: BoxConstraints(maxWidth: 70, maxHeight: 28),
            decoration: BoxDecoration(
              color: Color(0xFFEDE7F6),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              "Simpan",
              style: TextStyle(
                color: Color(0xFF4A148C),
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFEDE7F6),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            // Pilihan Jenis Konten
            Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTypeButton(
                      "Foto", Icons.image, Color(0xFF4CAF50), true),
                  _buildTypeButton(
                      "Video", Icons.videocam, Color(0xFFE53935), false),
                  _buildTypeButton(
                      "Status", Icons.text_fields, Color(0xFF4A148C), false),
                ],
              ),
            ),

            // Area Konten
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Informasi User
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFFD1C4E9),
                          radius: 20,
                          child: Text(
                            "M",
                            style: TextStyle(
                              color: Color(0xFF4A148C),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mahasiswa Aktif",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.public,
                                  size: 14,
                                  color: Colors.grey[600],
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "Publik",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                    // Caption
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 3,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Text(
                        "Tulis caption untuk foto Anda...",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Preview Area
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFE1BEE7).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFF4A148C).withOpacity(0.2),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF4A148C).withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Icon(
                                  Icons.add_photo_alternate,
                                  size: 50,
                                  color: Color(0xFF4A148C),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Ketuk untuk memilih foto",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF4A148C),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Ukuran maksimum 10MB",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer Tools
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildToolButton(Icons.crop, "Potong"),
                  _buildToolButton(Icons.tune, "Filter"),
                  _buildToolButton(Icons.brush, "Edit"),
                  _buildToolButton(Icons.auto_fix_high, "Efek"),
                  _buildToolButton(Icons.text_fields, "Teks"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeButton(
      String label, IconData icon, Color color, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? color.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: isSelected ? Border.all(color: color, width: 1.5) : null,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? color : Colors.grey[600],
            size: 20,
          ),
          SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? color : Colors.grey[700],
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Color(0xFF4A148C),
          size: 24,
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
