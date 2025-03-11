import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MedsosScreen());
}

class MedsosScreen extends StatefulWidget {
  const MedsosScreen({super.key});

  @override
  MedsosScreenState createState() => MedsosScreenState();
}

class MedsosScreenState extends State<MedsosScreen> {
  final List<String> imageList = [
    'assets/images/test_img.jpg',
    'assets/images/cat.jpg',
    'assets/images/cat.jpg',
    'assets/images/cat.jpg',
    'assets/images/cat.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Carousel Slider untuk Beasiswa dll
          Padding(
            padding: const EdgeInsets.all(10),
            child: CarouselSlider(
              options: CarouselOptions(height: 300, autoPlay: true),
              items: imageList.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Stack(
                        children: [
                          // Background image
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Text overlay
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(150),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "Your Text Here",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),

          // Kuliah & Tugas
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Kuliah hari ini ...",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                    "Pemrograman Visual, 9.30 (C205); Data Mining 13.00 (C307)"),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tugas", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Tubes 1 Provis (besok, 19.00)"),
              ],
            ),
          ),

          // Menu Grid
          Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              children: [
                _buildMenuItem(Icons.favorite, "Mental Health", () {
                  Navigator.of(context).pushNamed("/mental_health");
                }),
                _buildMenuItem(Icons.folder, "Akademik", () {
                  Navigator.of(context).pushNamed("/akademik");
                }),
                _buildMenuItem(Icons.account_balance_wallet, "Keuangan", () {
                  Navigator.of(context).pushNamed("/keuangan");
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return Column(
      children: [
        // Container for the icon with rounded square background
        InkWell(
          onTap: onTap, // Handle the tap event
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple[50], // Background color
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            padding: const EdgeInsets.all(20),
            child: Icon(
              icon,
              size: 40, // Increased icon size
              color: Colors.purple, // Icon color
            ),
          ),
        ),
        const SizedBox(height: 8), // Spacing between icon and label
        // Label text
        Text(
          label,
          style: const TextStyle(
            fontSize: 14, // Increased font size
            fontWeight: FontWeight.bold, // Optional: Make the text bold
          ),
        ),
      ],
    );
  }
}
