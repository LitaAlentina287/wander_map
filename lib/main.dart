import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // ✅ Tambahan baris ini

void main() {
  runApp(const WanderMapApp());
}

class WanderMapApp extends StatelessWidget {
  const WanderMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WanderMap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF64B5F6), // biru muda lembut
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF64B5F6),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.pacifico(
            // ✅ Tambahan font meringkel
            fontSize: 26,
            color: Colors.white,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // 🔹 Ganti URL dengan path gambar lokal
  List<Map<String, String>> get destinations => [
    {
      'name': 'Bali Island',
      'location': 'Indonesia',
      'image': 'assets/images/bali_island.jpg',
    },
    {
      'name': 'Mount Fuji',
      'location': 'Japan',
      'image': 'assets/images/mount_fuji.jpg',
    },
    {
      'name': 'Santorini',
      'location': 'Greece',
      'image': 'assets/images/santorini.jpg',
    },
    {
      'name': 'Eiffel Tower',
      'location': 'France',
      'image': 'assets/images/eiffel_tower.jpg',
    },
    {
      'name': 'Raja Ampat',
      'location': 'Indonesia',
      'image': 'assets/images/raja_ampat.jpg',
    },
    {
      'name': 'Grand Canyon',
      'location': 'USA',
      'image': 'assets/images/grand_canyon.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WanderMap')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Popular Destinations',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // 🔹 Scroll horizontal
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  final dest = destinations[index];
                  return Container(
                    width: 160,
                    margin: const EdgeInsets.only(right: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // 🔹 Gunakan Image.asset
                          Image.asset(
                            dest['image']!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey,
                                child: const Center(
                                  child: Icon(
                                    Icons.broken_image,
                                    color: Colors.red,
                                  ),
                                ),
                              );
                            },
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.black54, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 8,
                            bottom: 8,
                            child: Text(
                              dest['name']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black45,
                                    offset: Offset(1, 1),
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              'Explore More',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // 🔹 Scroll vertikal
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                final dest = destinations[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.asset(
                          dest['image']!,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey,
                              height: 180,
                              child: const Center(
                                child: Icon(Icons.broken_image, size: 40),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dest['name']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Color(0xFF64B5F6),
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  dest['location']!,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
