import 'package:flutter/material.dart';

class DoaSebelumMakanPage extends StatelessWidget {
  const DoaSebelumMakanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7DBF7B),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Tombol kembali + ikon masjid
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    'assets/icon/mosque.png',
                    height: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Judul
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Do’a Sebelum Makan",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Konten doa
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      // Gambar sebelum makan
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/icon/makan.png',
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Teks Arab
                      const Text(
                        'اللَّهُمَّ بَارِكْ لَناَ فِيْمَا رَزَقْتَنا وَقِنَا عَذَابَ النَّارِ ',
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Scheherazade',
                          color: Colors.black,
                          height: 2.2,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Teks latin
                      const Text(
                        'Allāhumma bārik lanā fī mā razaqtanā wa qinā ażāban nār ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Terjemahan
                      const Text(
                        '“Ya Allah, berkahilah kami pada rezeki yang telah Kaukaruniakan '
                        'untuk kami dan lindungilah kami dari siksa neraka. '
                        'Dengan nama Allah yang Maha Pengasih lagi Maha Penyayang.”',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
