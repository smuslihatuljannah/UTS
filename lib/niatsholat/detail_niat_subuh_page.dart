import 'package:flutter/material.dart';

class DetailNiatSubuhPage extends StatelessWidget {
  const DetailNiatSubuhPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFC8FACC), Color(0xFFE8FFF0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.green, size: 28),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Text(
                        'Niat Sholat Subuh',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  ' أُصَلِّيَ فَرْضَ الصُّبْحِ رَكْعَتَيْنِ مُسْتَقْبِلَ الْقِبْلَةِ أَدَاءً لِلّٰهِ تَعَالَى',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Scheherazade',
                    color: Colors.black87,
                    height: 2.2,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Ushalli fardhas shubhi rak‘ataini mustaqbilal qiblati adā’an lillāhi ta‘ālā.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Artinya:\n“Aku niat shalat fardhu Subuh dua rakaat menghadap kiblat karena Allah Ta‘ala.”',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, color: Colors.black87),
                ),
                const Spacer(),
                const Icon(Icons.mosque, size: 80, color: Colors.green),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
