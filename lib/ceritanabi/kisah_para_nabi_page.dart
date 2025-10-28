import 'package:flutter/material.dart';
import '../utama/home_page.dart';
import '../ceritanabi/detail_nabi_page.dart';

class KisahParaNabiPage extends StatelessWidget {
  const KisahParaNabiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> nabiList = [
      {'nama': 'Nabi Muhammad SAW'},
      {'nama': 'Nabi Nuh AS'},
      {'nama': 'Nabi Musa AS'},
      {'nama': 'Nabi Isa AS'},
      {'nama': 'Nabi Ibrahim AS'},
      {'nama': 'Nabi Yunus AS'},
      {'nama': 'Nabi Yusuf AS'},
      {'nama': 'Nabi Daud AS'},
      {'nama': 'Nabi Sulaiman AS'},
      {'nama': 'Nabi Adam AS'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFEAF3EA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        title: const Text(
          'Kisah Para Nabi',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Teladan hidup penuh hikmah',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1,
                ),
                itemCount: nabiList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailNabiPage(
                            namaNabi: nabiList[index]['nama']!,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1EED8),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFF558B2F), width: 1.2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon/ceritanabi3.png',
                            height: 70,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            nabiList[index]['nama']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1B5E20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
