import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;
import '../utama/home_page.dart';

class ArahKiblatPage extends StatefulWidget {
  const ArahKiblatPage({super.key});

  @override
  State<ArahKiblatPage> createState() => _ArahKiblatPageState();
}

class _ArahKiblatPageState extends State<ArahKiblatPage> {
  double? _heading; // arah kompas (derajat)

  @override
  void initState() {
    super.initState();
    FlutterCompass.events?.listen((event) {
      setState(() {
        _heading = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double arahKiblat = 293; // contoh arah kiblat Indonesia barat (derajat)
    double? heading = _heading ?? 0;
    double selisih = (arahKiblat - heading) % 360;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F7EF),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // === Bagian Atas ===
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40), // spasi agar teks tetap di tengah
                  const Text(
                    'Arah Kiblat',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D6A4F),
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: Color(0xFF2D6A4F),
                    radius: 16,
                    child: Icon(Icons.person, color: Colors.white, size: 18),
                  ),
                ],
              ),
            ),

            // === Kompas ===
            Column(
              children: [
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF2D6A4F),
                      width: 4,
                    ),
                  ),
                  child: Transform.rotate(
                    angle: (heading * (math.pi / 180) * -1),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // jarum kompas
                        Transform.rotate(
                          angle: (selisih * (math.pi / 180)),
                          child: CustomPaint(
                            size: const Size(100, 100),
                            painter: _NeedlePainter(),
                          ),
                        ),

                        // label arah
                        Positioned(top: 20, child: _buildLabel('U')),
                        Positioned(bottom: 20, child: _buildLabel('S')),
                        Positioned(left: 20, child: _buildLabel('B')),
                        Positioned(right: 20, child: _buildLabel('T')),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '${selisih.toStringAsFixed(0)}° Arah Kiblat',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D6A4F),
                  ),
                ),
              ],
            ),

            // === Tombol Home ===
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                ),
                child: Container(
                  width: 100,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB7D3B0),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(Icons.home, color: Color(0xFF2D6A4F), size: 28),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF2D6A4F),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// === JARUM KOMPAS CUSTOM ===
class _NeedlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2D6A4F)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, size.height * 0.15);
    path.lineTo(size.width * 0.65, size.height / 2);
    path.lineTo(size.width / 2, size.height * 0.85);
    path.lineTo(size.width * 0.35, size.height / 2);
    path.close();

    canvas.drawPath(path, paint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 5,
        Paint()..color = const Color(0xFFF9F7EF));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
