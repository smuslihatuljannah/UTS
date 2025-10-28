import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String? iconPath;
  final IconData? icon;
  final VoidCallback? onTap;

  /// isHorizontal = true → tampilan baris (untuk Amalan Harian)
  /// isHorizontal = false → tampilan grid (untuk Fitur Islami)
  final bool isHorizontal;

  const FeatureCard({
    super.key,
    required this.title,
    this.iconPath,
    this.icon,
    this.onTap,
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 🟢 Pastikan GestureDetector membungkus seluruh widget
      onTap: onTap,
      child: isHorizontal ? _buildHorizontalCard() : _buildGridCard(),
    );
  }

  /// === Tampilan horizontal (untuk "Amalan Harian") ===
  Widget _buildHorizontalCard() {
    return Container(
      width: 190,
      height: 40,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F8EE),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.green.shade400,
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green.shade500,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(6),
            child: iconPath != null
                ? Image.asset(iconPath!, width: 24, height: 24)
                : Icon(icon ?? Icons.star, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.green.shade800,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// === Tampilan grid (untuk "Fitur Islami") ===
  Widget _buildGridCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 136, 184, 137),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPath != null)
            Image.asset(
              iconPath!,
              width: 48,
              height: 48,
              fit: BoxFit.contain,
            )
          else if (icon != null)
            Icon(icon, size: 48, color: Colors.green.shade800),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
