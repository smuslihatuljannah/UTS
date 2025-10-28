import 'package:flutter/material.dart';
import 'detail_niat_subuh_page.dart';
import 'detail_niat_dzuhur_page.dart';
import 'detail_niat_ashar_page.dart';
import 'detail_niat_maghrib_page.dart';
import 'detail_niat_isya_page.dart';

class NiatSholatPage extends StatelessWidget {
  const NiatSholatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB2F0C8), Color(0xFFE8F5E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.green, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Text(
                      'Niat Sholat',
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
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildCard(
                      context,
                      icon: Icons.cloud, // subuh
                      title: 'Sholat Subuh',
                      desc: '2 Rakaat',
                      page: const DetailNiatSubuhPage(),
                    ),
                    _buildCard(
                      context,
                      icon: Icons.wb_sunny, // dzuhur
                      title: 'Sholat Dzuhur',
                      desc: '4 Rakaat',
                      page: const DetailNiatDzuhurPage(),
                    ),
                    _buildCard(
                      context,
                      icon: Icons.sunny_snowing, // ashar
                      title: 'Sholat Ashar',
                      desc: '4 Rakaat',
                      page: const DetailNiatAsharPage(),
                    ),
                    _buildCard(
                      context,
                      icon: Icons.sunny, // maghrib
                      title: 'Sholat Maghrib',
                      desc: '3 Rakaat',
                      page: const DetailNiatMaghribPage(),
                    ),
                    _buildCard(
                      context,
                      icon: Icons.nights_stay, // isya
                      title: 'Sholat Isya',
                      desc: '4 Rakaat',
                      page: const DetailNiatIsyaPage(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String desc,
    required Widget page,
  }) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFB9FBC0), Color(0xFFD8F9E2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.green, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: TextStyle(color: Colors.green.shade700, fontSize: 14),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.green, size: 20),
          ],
        ),
      ),
    );
  }
}
