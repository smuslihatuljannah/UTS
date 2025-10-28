import 'package:flutter/material.dart';

class NiatWudhuPage extends StatelessWidget {
  const NiatWudhuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8FFF0),
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Niat Wudhu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🧍‍♂️ Gambar orang wudhu
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: Colors.green.shade300,
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    'assets/icon/wudhuu.jpg', // ganti sesuai file gambar kamu
                    height: 160,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // 🕌 Teks Arab
              const Text(
                'نَوَيْتُ الْوُضُوءَ لِرَفْعِ الْحَدَثِ الْأَصْغَرِ فَرْضًا لِلّٰهِ تَعَالَى',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Scheherazade',
                  color: Colors.black87,
                  height: 2.2,
                ),
              ),
              const SizedBox(height: 20),

              // 🌿 Transliterasi
              Text(
                'Nawaitul wudhu-a liraf‘il hadatsil ashghari fardhal lillahi ta‘ala',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green.shade800,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),

              // 🌼 Artinya
              const Text(
                'Artinya:\n“Aku niat berwudhu untuk menghilangkan hadats kecil fardhu karena Allah Ta‘ala.”',
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
    );
  }
}
