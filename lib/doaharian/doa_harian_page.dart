import 'package:flutter/material.dart';
import '../utama/home_page.dart';
import 'doa_bangun_tidur_page.dart';
import 'doa_mau_tidur_page.dart';
import 'doa_sebelum_makan_page.dart';
import 'doa_setelah_makan_page.dart';
import 'doa_mohon_ampunan_page.dart';
import 'doa_keluar_rumah_page.dart';
import 'doa_masuk_masjid_page.dart';
import 'doa_keluar_masjid_page.dart';
import 'doa_masuk_kamar_mandi_page.dart';
import 'doa_keluar_kamar_mandi_page.dart';
import 'doa_melihat_musibah_page.dart';

class DoaHarianPage extends StatelessWidget {
  const DoaHarianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7DBF7B),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // Judul utama
            const Icon(Icons.brightness_2_rounded,
                color: Colors.yellowAccent, size: 40),
            const SizedBox(height: 8),
            const Text(
              'Doa Harian Muslim',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Kumpulan Doa Sehari-hari',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 24),

            // Daftar doa
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  buildDoaCard(context, Icons.menu_book, 'Doa Bangun Tidur', const DoaBangunTidurPage()),
                  buildDoaCard(context, Icons.nightlight_round, 'Doa Mau Tidur', const DoaMauTidurPage()),
                  buildDoaCard(context, Icons.restaurant_menu, 'Doa Sebelum Makan', const DoaSebelumMakanPage()),
                  buildDoaCard(context, Icons.restaurant, 'Doa Setelah Makan', const DoaSetelahMakanPage()),
                  buildDoaCard(context, Icons.favorite, 'Doa Mohon Ampunan', const DoaMohonAmpunanPage()),
                  buildDoaCard(context, Icons.home, 'Doa Keluar Rumah', const DoaKeluarRumahPage()),
                  buildDoaCard(context, Icons.mosque, 'Doa Masuk Masjid', const DoaMasukMasjidPage()),
                  buildDoaCard(context, Icons.door_front_door, 'Doa Keluar Masjid', const DoaKeluarMasjidPage()),
                  buildDoaCard(context, Icons.wash, 'Doa Masuk Kamar Mandi', const DoaMasukKamarMandiPage()),
                  buildDoaCard(context, Icons.shower, 'Doa Keluar dari Kamar Mandi', const DoaKeluarKamarMandiPage()),
                  buildDoaCard(context, Icons.heart_broken, 'Doa Ketika Melihat Orang Lain Tertimpa Musibah', const DoaMelihatMusibahPage()),
                ],
              ),
            ),
          ],
        ),
      ),

      // Tombol navigasi bawah (hanya Home)
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.green, size: 30),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDoaCard(BuildContext context, IconData icon, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFE8F5E9),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.green.shade700, size: 28),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.green.shade900,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
