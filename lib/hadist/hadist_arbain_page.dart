// lib/pages/hadist_arbain_page.dart
import 'package:flutter/material.dart';
import 'hadist_detail_page.dart';

class HadistArbainPage extends StatelessWidget {
  const HadistArbainPage({super.key});

  // semua 40 hadist: perawi, arab, arti (ID)
  final List<Map<String, String>> hadistList = const [
    {
      "perawi": "Umar bin Khattab",
      "arab": "إِنَّمَا الأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى",
      "arti":
          "Sesungguhnya setiap perbuatan tergantung pada niatnya, dan tiap-tiap orang (akan dibalas) sesuai dengan apa yang ia niatkan."
    },
    {
      "perawi": "Umar bin Khattab",
      "arab":
          "مَنْ كَانَتْ هِجْرَتُهُ إِلَى اللَّهِ وَرَسُولِهِ فَهِجْرَتُهُ إِلَى اللَّهِ وَرَسُولِهِ ۖ وَمَنْ كَانَتْ هِجْرَتُهُ لِدُنْيَا يُصِيبُهَا أَوِ امْرَأَةٍ يَنْكِحُهَا فَهِجْرَتُهُ إِلَى مَا هَاجَرَ إِلَيْهِ",
      "arti":
          "Barang siapa hijrahnya karena Allah dan Rasul-Nya, maka hijrahnya kepada Allah dan Rasul-Nya; dan barang siapa hijrahnya karena dunia yang ingin diperolehnya atau karena wanita yang ingin dinikahinya, maka hijrahnya kepada apa yang ia hijrahkan untuk itu."
    },
    {
      "perawi": "Abu Abdurrahman (Imam Bukhari)",
      "arab": "بُنِيَ الإِسْلَامُ عَلَى خَمْسٍ: شَهَادَةِ أَنْ لاَ إِلَهَ إِلاَّ اللَّهُ وَأَنَّ مُحَمَّدًا رَسُولُ اللَّهِ، وَإِقَامِ الصَّلاَةِ، وَإِيتَاءِ الزَّكَاةِ، وَحَجِّ الْبَيْتِ، وَصَوْمِ رَمَضَانَ",
      "arti":
          "Islam dibangun atas lima hal: bersaksi bahwa tidak ada ilah selain Allah dan bahwa Muhammad adalah utusan Allah; mendirikan shalat; menunaikan zakat; menunaikan haji; dan puasa Ramadhan."
    },
    {
      "perawi": "Abdullah bin Mas'ud",
      "arab": "إِنَّمَا الأُمُورُ بِخَوَاتِيمِهَا",
      "arti":
          "Sesungguhnya perkara itu tergantung pada akhirnya (kualitas akhir perbuatan menentukan nilainya)."
    },
    {
      "perawi": "Aisyah r.a.",
      "arab":
          "مَنْ أَحْدَثَ فِي أَمْرِنَا هَذَا مَا لَيْسَ مِنْهُ فَهُوَ رَدٌّ",
      "arti":
          "Barang siapa yang mengada-adakan sesuatu dalam urusan kami ini yang bukan darinya, maka hal itu ditolak."
    },
    {
      "perawi": "Abu Abdullah (Imam Muslim)",
      "arab": "الْحَلَالُ بَيِّنٌ وَالْحَرَامُ بَيِّنٌ",
      "arti": "Yang halal itu jelas dan yang haram itu jelas."
    },
    {
      "perawi": "Tamim ad-Dari",
      "arab": "الدِّينُ النَّصِيحَةُ",
      "arti": "Agama adalah nasihat (ketulusan dan kejujuran) untuk Allah, kitab-Nya, rasul-Nya, pemimpin kaum muslimin, dan kaum muslimin secara keseluruhan."
    },
    {
      "perawi": "Abdullah bin Umar",
      "arab": "أُمرْتُ أنْ أُقاتِلَ النَّاسَ حَتَّى يَشْهَدُوا أَن لَا إِلَهَ إِلَّا اللَّهُ",
      "arti":
          "Aku diperintahkan untuk memerangi manusia sampai mereka mengucapkan bahwa tidak ada ilah selain Allah..."
    },
    {
      "perawi": "Abu Hurairah",
      "arab": "مَا نَهَيْتُكُمْ عَنْهُ فَاجْتَنِبُوهُ",
      "arti": "Apa yang aku larang, jauhilah."
    },
    {
      "perawi": "Abu Hurairah",
      "arab": "إِنَّ اللَّهَ طَيِّبٌ لَا يَقْبَلُ إِلَّا طَيِّبًا",
      "arti":
          "Sesungguhnya Allah itu baik (tulus) dan tidak menerima kecuali yang baik (amal dan niat yang baik)."
    },
    {
      "perawi": "An-Nu'man bin Basyir",
      "arab": "الْحَلَالُ مَعْرُوفٌ وَالْحَرَامُ مَعْرُوفٌ",
      "arti": "Yang halal itu jelas dan yang haram itu jelas."
    },
    {
      "perawi": "Abu Hurairah",
      "arab": "تَرُكُ مَا يُرِيبُكَ إِلَى مَا لَا يُرِيبُكَ",
      "arti":
          "Tinggalkanlah perkara yang meragukanmu kepada perkara yang tidak meragukanmu."
    },
    {
      "perawi": "Anas bin Malik",
      "arab": "لَا يُؤْمِنُ أَحَدُكُمْ حَتَّى يُحِبَّ لِأَخِيهِ مَا يُحِبُّ لِنَفْسِهِ",
      "arti":
          "Tidaklah sempurna iman seorang dari kalian hingga ia mencintai untuk saudaranya apa yang ia cintai untuk dirinya sendiri."
    },
    {
      "perawi": "Ibnu Mas'ud",
      "arab": "لَا يَحِلُّ دَمُ امْرِئٍ مُسْلِمٍ إِلَّا بِإِحْدَى ثَلاثٍ",
      "arti":
          "Tidak halal darah seorang muslim kecuali dalam tiga perkara (qishash, orang yang berzina yang sudah menikah, pembunuh yang jelas)."
    },
    {
      "perawi": "Abu Hurairah",
      "arab": "مَنْ آمَنَ بِاللهِ وَالْيَوْمِ الْآخِرِ فَلَا يُؤْذِي جَارَهُ",
      "arti": "Barang siapa beriman kepada Allah dan hari akhir, maka jangan menyakiti tetangganya."
    },
    {
      "perawi": "Abu Hurairah",
      "arab": "إِيَّاكُمْ وَالْغَضَبَ",
      "arti": "Hendaklah kalian menjauhi marah."
    },
    {
      "perawi": "Abdullah bin Abbas",
      "arab": "اتَّقِ اللَّهَ حَيَاءً يَحْيَاكَ",
      "arti": "Jagalah Allah (takwa), niscaya Dia akan menjagamu."
    },
    {
      "perawi": "Abu Ya'la Syaddad bin Aus",
      "arab": "إِنَّ اللَّهَ كَتَبَ الْإِحْسَانَ",
      "arti": "Sesungguhnya Allah mewajibkan ihsan (kebaikan, kesempurnaan) dalam segala perkara."
    },
    {
      "perawi": "Abdullah bin Abbas",
      "arab": "يَا غُلاَمُ عَلَّمْتُكَ كَلِمَاتٍ",
      "arti":
          "Wahai pemuda, aku akan ajarkan kepadamu beberapa amalan: - Perbanyaklah istighfar kepada Allah..."
    },
    {
      "perawi": "Abu Mas'ud Al-Uqbah",
      "arab": "مَا قِيلَ مِنَ الْأَنْبِيَاءِ قَبْلَنَا",
      "arti":
          "Di antara ucapan para nabi sebelum kita adalah ajakan untuk beriman, beribadah, dan berakhlak mulia."
    },
    {
      "perawi": "Abu Amr Sufyan bin Abdullah",
      "arab": "قُلْ آمَنْتُ بِاللَّهِ",
      "arti": "Katakanlah: aku beriman kepada Allah."
    },
    {
      "perawi": "Jabir bin Abdullah",
      "arab": "لَا يُؤْمِنُ أَحَدُكُمْ حَتَّى يَكُونَ هَوَاهُ تَبَعًا لِمَا جِئْتُ بِهِ",
      "arti":
          "Tidaklah salah seorang dari kalian beriman sampai hawa nafsunya mengikuti apa yang aku bawa (ajaran Nabi)."
    },
    {
      "perawi": "Abu Malik al-Harith",
      "arab": "الطَّهَارَةُ شَطْرُ الإِيمَانِ",
      "arti": "Kesucian (wudhu/bersih) adalah sebagian dari iman."
    },
    {
      "perawi": "Abu Dzar Al-Ghifari",
      "arab": "اتَّقُوا اللَّهَ حَيْثُمَا كُنْتُمْ",
      "arti": "Bertakwalah kepada Allah di mana pun kalian berada."
    },
    {
      "perawi": "Abu Dzar Al-Ghifari",
      "arab": "إِنَّ اللَّهَ قَالَ",
      "arti": "Rasulullah bersabda bahwa Allah berfirman mengenai hamba-Nya yang berbuat baik."
    },
    {
      "perawi": "Abu Hurairah",
      "arab": "مَنْ نَفَّسَ عَنْ مُؤْمِنٍ كُرْبَةً نَفَّسَ اللَّهُ عَنْهُ كُرْبَةً مِنْ كُرَبِ يَوْمِ الْقِيَامَةِ",
      "arti":
          "Barang siapa meringankan kesulitan seorang mukmin, Allah akan meringankan kesulitannya pada hari kiamat."
    },
    {
      "perawi": "Abu Hurairah",
      "arab": "كُلُّ مَنْ عَلَى الْأَرْضِ سَيُعْطَى",
      "arti":
          "Setiap persendian manusia harus bersedekah tiap hari; memberi senyuman adalah sedekah, menyingkirkan gangguan di jalan adalah sedekah, dan seterusnya."
    },
    {
      "perawi": "Anas bin Malik",
      "arab": "لَا يُؤْمِنُ أَحَدُكُمْ حَتَّى يُحِبَّ لأَخِيهِ مَا يُحِبُّ لِنَفْسِهِ",
      "arti":
          "Tidaklah seseorang beriman sampai ia mencintai untuk saudaranya apa yang ia cintai untuk dirinya sendiri."
    },
    {
      "perawi": "Ibnu Abbas",
      "arab": "إِذَا اسْتَحْيَيْتَ فَاصْنَعْ مَا شِئْتَ",
      "arti": "Jika kamu malu, lakukanlah apa yang kamu kehendaki (dengan batasan baik)."
    },
    {
      "perawi": "Abu Hurairah",
      "arab": "مَنْ سَتَرَ مُؤْمِنًا سَتَرَهُ اللَّهُ",
      "arti":
          "Barang siapa menutupi aib seorang muslim, Allah akan menutupi aibnya pada hari kiamat."
    },
    {
      "perawi": "Abu Hurairah",
      "arab": "مَنْ أَرَادَ بِالْمَرْءِ خَيْرًا",
      "arti":
          "Barang siapa yang dikehendaki Allah kebaikan, Dia akan memberinya pemahaman dalam agama."
    },
    {
      "perawi": "Abu Sa'id Al-Khudri",
      "arab": "لاَ تَجْلِسُوا فِي الطُّرُقِ",
      "arti": "Janganlah kalian duduk di jalanan (menghambat orang atau berleha-leha tanpa manfaat)."
    },
    {
      "perawi": "Abdullah bin Abbas",
      "arab": "كُلُّ شَيْءٍ بِعِلَّتِهِ",
      "arti": "Setiap sesuatu tergantung pada sebab dan akibatnya; manusia diberi sesuai amal dan niatnya."
    },
    {
      "perawi": "Abu Sa'id Al-Khudri",
      "arab": "لاَ ضَرَرَ وَلاَ ضِرَارَ",
      "arti": "Tidak ada (hukum) membahayakan dan tidak boleh saling membahayakan."
    },
    {
      "perawi": "Abu Hurairah",
      "arab": "آمَنْتُ بِاللَّهِ",
      "arti": "Barang siapa beriman kepada Allah dan hari akhir, hendaklah berkata baik atau diam."
    },
    {
      "perawi": "Anas bin Malik",
      "arab": "يَسِّرُوا وَلَا تُعَسِّرُوا",
      "arti": "Mudah-mudahan (permudahlah urusan), jangan dipersulit."
    },
    {
      "perawi": "Ibnu Abbas",
      "arab": "إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ",
      "arti": "Jika kamu malu, lakukan apa yang kamu mau — (ingatlah) amal tergantung niat."
    },
    {
      "perawi": "Abdullah bin Umar",
      "arab": "أَقْبَلَ عَلَيَّ رَسُولُ اللَّهِ",
      "arti":
          "Rasulullah memegang pundakku dan bersabda: 'Jadilah kamu pemuda yang berbakti kepada Allah dan orang tua...' (dorongan ketaatan dan akhlak)."
    },
    {
      "perawi": "Abu Hurairah",
      "arab": "إِنَّ اللَّهَ يُحِبُّ إِذَا عَمِلَ أَحَدُكُمْ عَمَلًا أَنْ يُتْقِنَهُ",
      "arti":
          "Sesungguhnya Allah mencintai jika salah seorang dari kalian melakukan suatu amal maka dia menyempurnakannya."
    },
    {
      "perawi": "Abu Hurairah",
      "arab": "ثَلَاثٌ يَأْتِينَ عَلَى الْمَرْءِ",
      "arti":
          "Ada tiga hal yang menyelamatkan dan tiga yang membinasakan (ringkasan: iman, amal, ihsan; serta bahaya dari hawa nafsu, dunia, dan sikap buruk)."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9F4),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER HIJAU
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF4A9B7D),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Row(
                children: [
                  // kembali ke previous (atau bisa ganti sesuai HomePage jika mau)
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hadist Arbain",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Koleksi 40 Hadist Pilihan",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.menu_book_rounded, color: Colors.white, size: 30),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // LIST HADIST
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: hadistList.length,
                itemBuilder: (context, index) {
                  final item = hadistList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HadistDetailPage(
                            nomor: index + 1,
                            perawi: item['perawi'] ?? '',
                            arab: item['arab'] ?? '',
                            arti: item['arti'] ?? '',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: const Color(0xFF4A9B7D),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                (index + 1).toString().padLeft(2, '0'),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['perawi'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF205C40),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  item['arti'] ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right, color: Colors.green, size: 24),
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
