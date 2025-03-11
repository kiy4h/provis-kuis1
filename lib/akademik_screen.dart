import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: Colors.grey[100],
    ),
    home: const AkademikScreen(),
  ));
}

class AkademikScreen extends StatelessWidget {
  const AkademikScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A148C), // Deep purple
        elevation: 0,
        title: const Text(
          'Daftar Mata Kuliah',
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
      body: const CourseListView(),
    );
  }
}

class CourseListView extends StatelessWidget {
  const CourseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> courses = [
      {
        'kode': 'IK237',
        'nama': 'ANALISIS DAN DESAIN ALGORITMA',
        'sks': '3',
        'dosen': 'Yaya Wihardi, S.Kom., M.Kom.',
        'tahun': '2024/2025 - Genap',
      },
        {
        'kode': 'IK300',
        'nama': 'PEMROGRAMAN VISUAL DAN PIRANTI BERGERAK',
        'sks': '3',
        'dosen': 'Dr. Yudi Wibisono, S.T., M.T.',
        'tahun': '2024/2025 - Genap',
      },
      {
        'kode': 'IK250',
        'nama': 'SISTEM OPERASI',
        'sks': '3',
        'dosen': 'Herbert, S.Kom., M.T.',
        'tahun': '2024/2025 - Genap',
      },
      {
        'kode': 'IK290',
        'nama': 'DESAIN DAN PEMROGRAMAN BERORIENTASI OBJEK',
        'sks': '3',
        'dosen': 'Rosa Ariani Sukamto, M.T.',
        'tahun': '2024/2025 - Genap',
      },
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
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary card
            Container(
              padding: const EdgeInsets.all(16),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSummaryItem('Total MK', '4', Icons.code),
                  _buildSummaryItem('Total SKS', '12', Icons.school),
                  _buildSummaryItem('Semester', 'Genap', Icons.calendar_today),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            const Text(
              'Mata Kuliah Aktif',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A148C),
              ),
            ),
            const SizedBox(height: 12),

            // Courses list
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return CourseCard(course: courses[index], index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String title, String value, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFD1C4E9),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: const Color(0xFF4A148C),
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4A148C),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}

class CourseCard extends StatelessWidget {
  final Map<String, String> course;
  final int index;

  const CourseCard({
    Key? key,
    required this.course,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            splashColor: Colors.purple.withOpacity(0.1),
            highlightColor: Colors.purple.withOpacity(0.05),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDE7F6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          course['kode']!,
                          style: const TextStyle(
                            color: Color(0xFF4A148C),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD1C4E9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.book,
                              size: 14,
                              color: Color(0xFF4A148C),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${course['sks']!} SKS',
                              style: const TextStyle(
                                color: Color(0xFF4A148C),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    course['nama']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212121),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 16,
                        color: Color(0xFF673AB7),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          course['dosen']!,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[700],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Color(0xFF673AB7),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        course['tahun']!,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
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