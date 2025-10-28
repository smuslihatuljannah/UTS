import 'package:flutter/material.dart';

class DetailNabiPage extends StatelessWidget {
  final String namaNabi;
  const DetailNabiPage({super.key, required this.namaNabi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF3EA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tombol kembali
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF1B5E20)),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 10),

              // Judul
              Text(
                namaNabi,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B5E20),
                ),
              ),
              const SizedBox(height: 10),

              // Gambar
              Center(
                child: Image.asset(
                  'assets/icon/mosque1.png',
                  height: 120,
                ),
              ),
              const SizedBox(height: 16),

              // Isi kisah
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    _getKisahNabi(namaNabi),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi kisah 10 nabi
  String _getKisahNabi(String nama) {
    switch (nama) {
      case 'Nabi Muhammad SAW':
        return '''
Rasulullah SAW dilahirkan pada hari Senin, 12 Rabi’ul Awwal tahun Gajah yang bertepatan dengan tanggal 21 April 571 M. Beliau berasal dari suku Quraisy, suku yang paling terkenal dan dihormati di kalangan masyarakat Arab pada masa itu, dan dari Bani Hasyim yang memiliki kedudukan mulia. Nabi Muhammad SAW lahir dalam keadaan yatim karena ayahnya wafat ketika beliau masih dalam kandungan ibunya yang berusia dua bulan. Setelah lahir, beliau diasuh oleh kakeknya, Abdul Muthalib, dan disusui oleh Halimah Sa’diyah yang dengan keikhlasannya diberi kelimpahan susu oleh Allah SWT. Ketika berusia enam tahun, ibunda beliau wafat, dan Nabi kecil kembali diasuh oleh kakeknya hingga usia delapan tahun, kemudian oleh pamannya, Abu Thalib. Dalam asuhan pamannya, Nabi tumbuh menjadi pribadi yang cerdas, jujur, dan berakhlak mulia. Saat muda, Nabi diajak Abu Thalib berdagang ke Syam, dan di sana seorang pendeta bernama Buhaira mengenali tanda-tanda kenabian pada diri beliau serta memperingatkan agar tidak membawa Nabi terlalu jauh karena khawatir kaum Yahudi akan mencelakainya. Pada usia 25 tahun, Nabi menikah dengan Khadijah, seorang wanita kaya dan terpandang yang tertarik oleh kejujuran dan akhlak mulia beliau. Pernikahan mereka dipenuhi cinta, kesetiaan, dan dukungan penuh dari Khadijah terhadap perjuangan dakwah Nabi. Ketika mendekati usia 40 tahun, Nabi mulai menyendiri di Gua Hira untuk beribadah dan merenungi kebesaran Allah SWT. Di sanalah beliau menerima wahyu pertama melalui Malaikat Jibril berupa Surah Al-‘Alaq ayat 1–5, yang menandai awal tugasnya sebagai Rasul terakhir. Setelah itu, beliau mulai berdakwah kepada masyarakat, meskipun banyak mendapat penentangan dari kaum Quraisy, terutama Abu Jahal dan Abu Lahab. Karena tekanan yang meningkat, Nabi dan para pengikutnya hijrah ke Madinah pada tahun 622 M, di mana beliau diterima dengan baik dan membangun masyarakat Islam yang kuat. Di sana, perintah zakat dan kurban mulai ditetapkan untuk menumbuhkan semangat berbagi dan membantu sesama. Setelah dakwahnya sempurna dan Islam tersebar luas, mulai tampak tanda-tanda perpisahan Rasulullah SAW. Pada hari Senin, ketika kaum Muslimin sedang melaksanakan salat Subuh yang diimami Abu Bakar, Rasulullah membuka tirai rumahnya, tersenyum, dan memberi isyarat agar mereka melanjutkan salat. Tak lama kemudian, pada waktu dhuha, Senin 12 Rabi’ul Awwal tahun 11 Hijriah, Rasulullah SAW wafat pada usia 63 tahun. Umat Islam saat itu diliputi kesedihan mendalam karena kehilangan kekasih tercinta, penutup para nabi, dan teladan bagi seluruh umat manusia.
''';
      case 'Nabi Nuh AS':
        return '''
Nabi Nuh AS merupakan salah satu dari 25 nabi dan rasul yang wajib diimani oleh umat Islam. Kisah beliau terkenal dengan peristiwa banjir besar yang menimpa kaumnya karena mereka menolak untuk taat dan bertobat kepada Allah SWT. Nabi Nuh AS yang berdakwah selama 500 tahun dengan penuh kesabaran hanya memiliki sekitar 70 hingga 80 pengikut setia. Atas perintah Allah SWT, beliau membuat kapal besar di atas bukit bersama para pengikutnya yang taat, sementara kaumnya yang durhaka justru mengejek dan melempar kotoran kepada mereka. Setelah kapal selesai, Nabi Nuh AS membawa para pengikutnya beserta sepasang dari setiap jenis hewan dan benih tumbuhan ke dalam kapal. Tak lama kemudian, hujan deras turun selama empat puluh hari empat puluh malam hingga menimbulkan banjir bandang yang menenggelamkan seluruh daratan, kecuali mereka yang berada di dalam kapal Nabi Nuh AS. Setelah 150 hari, air mulai surut dan mereka memulai kehidupan baru dengan penuh ketaatan kepada Allah SWT. Namun, salah satu putra Nabi Nuh AS, yaitu Kan’an, menolak ajakan ayahnya untuk naik ke kapal dan tetap sombong meski telah diperingatkan bahwa tidak ada yang akan selamat dari azab Allah SWT. Akhirnya, Kan’an pun tenggelam bersama kaum yang durhaka. Kisah ini mengajarkan banyak hikmah, antara lain pentingnya kesabaran, keteguhan iman, dan ketulusan dalam berdakwah. Anak-anak dapat belajar dari ketabahan Nabi Nuh AS yang tetap sabar menghadapi penolakan dan ejekan, serta dari kisah Kan’an yang menunjukkan akibat buruk dari kesombongan dan kekufuran. Dari kisah ini, kita diajarkan bahwa beriman, sabar, dan tawakal kepada Allah SWT adalah kunci keselamatan di dunia dan akhirat.
''';
      case 'Nabi Musa AS':
        return '''
Nabi Musa AS merupakan salah satu nabi yang paling sering disebut dalam Al-Qur’an, yaitu sebanyak 136 kali. Beliau dikenal dengan mukjizat tongkatnya yang dapat berubah menjadi ular dan mampu membelah laut atas izin Allah SWT. Nabi Musa AS termasuk golongan ulul azmi yang diberi kitab Taurat dan diutus untuk menghadapi Raja Firaun yang zalim. Ia lahir di Mesir pada masa kekuasaan Firaun yang memerintahkan pembunuhan bayi laki-laki dari Bani Israil karena takut akan ramalan bahwa akan lahir seorang anak yang kelak menghancurkan kekuasaannya. Atas petunjuk Allah, ibunda Musa, Yukaibid, menghanyutkan Musa dalam peti ke Sungai Nil hingga ditemukan oleh istri Firaun, Asiyah, yang kemudian merawatnya. Secara ajaib, Musa kembali diasuh oleh ibu kandungnya sendiri tanpa diketahui Firaun. Setelah dewasa, Musa meninggalkan istana karena membunuh seorang prajurit Firaun secara tidak sengaja dan pergi ke negeri Madyan, tempat ia bertemu Nabi Syuaib AS serta menikahi salah satu putrinya. Setelah sepuluh tahun, Musa kembali ke Mesir dan menerima wahyu di Bukit Thursina, di mana Allah memerintahkannya untuk berdakwah kepada Firaun. Dengan mukjizat tongkatnya, Musa menghadapi para penyihir Firaun, dan banyak dari mereka akhirnya beriman kepada Allah. Firaun murka dan mengejar Musa serta pengikutnya hingga ke Laut Merah. Atas perintah Allah, Nabi Musa memukulkan tongkatnya hingga laut terbelah dan menyelamatkan Bani Israil, sementara Firaun dan pasukannya tenggelam. Dalam perjalanan hidupnya, Nabi Musa juga bertemu dengan Nabi Khidir untuk menimba ilmu, meskipun ia sempat kesulitan bersabar terhadap tindakan-tindakan misterius Khidir yang ternyata penuh hikmah. Setelah menunaikan tugas dakwahnya dan memimpin Bani Israil, Nabi Musa wafat pada usia 120 tahun di Gunung Nebu, Yordania, dekat Baitul Maqdis. Kisah hidup Nabi Musa AS mengajarkan keteguhan iman, kesabaran dalam menghadapi cobaan, dan keyakinan penuh kepada kekuasaan Allah SWT.
''';
      case 'Nabi Isa AS':
        return '''
Nabi Isa AS adalah salah satu nabi dan rasul Allah yang diutus kepada Bani Israil di Palestina. Ia memiliki banyak mukjizat dan keistimewaan, di antaranya lahir tanpa ayah, berbicara sejak bayi, menyembuhkan orang buta dan berpenyakit kusta, menghidupkan orang mati, serta mengetahui hal-hal ghaib dengan izin Allah SWT. Nabi Isa disebut juga Al-Masih, Ruhullah, dan Kalimatullah. Ia lahir dari rahim Maryam, seorang wanita suci keturunan Imran, tanpa melalui seorang ayah. Kelahiran Nabi Isa merupakan kehendak Allah SWT yang hanya berkata “Kun” (jadilah), maka terjadilah. Ketika melahirkan, Maryam bersandar pada pohon kurma dan Allah memberinya buah kurma serta air untuk menguatkannya. Setelah melahirkan di Baitullaham (Bethlehem), Maryam membawa bayinya kepada kaumnya yang menuduhnya berbuat zina, namun Nabi Isa yang masih bayi langsung berbicara membela ibunya dan menyatakan dirinya sebagai hamba Allah yang kelak akan menjadi nabi. Setelah dewasa, Nabi Isa diangkat menjadi rasul dan diutus untuk berdakwah kepada Bani Israil agar kembali menyembah Allah dan meninggalkan kesesatan. Ia membawa kitab Injil yang berisi petunjuk dan cahaya bagi orang-orang beriman. Dalam dakwahnya, Nabi Isa dibantu oleh para pengikut setianya yang disebut Hawariyyun, namun sebagian besar Bani Israil menolak ajarannya dan bersekongkol dengan bangsa Romawi untuk membunuhnya. Karena itu, Allah menyelamatkan Nabi Isa dengan mengangkatnya ke langit, sedangkan orang yang diserupakan dengan wajahnya, yaitu Yudas Iskariot, disalib oleh tentara Romawi. Allah menegaskan dalam Al-Qur’an bahwa Nabi Isa tidak dibunuh dan tidak disalib, melainkan diangkat ke sisi-Nya dalam keadaan hidup. Kisah Nabi Isa AS mengandung banyak hikmah tentang keimanan, keteguhan dalam berdakwah, serta bukti kekuasaan Allah SWT atas segala sesuatu.
''';
      case 'Nabi Ibrahim AS':
        return '''
Nabi Ibrahim AS adalah seorang nabi yang dikenal karena keteguhannya dalam menegakkan tauhid dan menentang penyembahan berhala di tengah kaumnya. Ia lahir pada masa Raja Namrud yang zalim di Kerajaan Babilonia, ketika semua bayi laki-laki diperintahkan untuk dibunuh karena ramalan tentang kelahiran seorang anak yang kelak akan menghancurkan kekuasaan sang raja. Ibunya menyembunyikan Nabi Ibrahim di sebuah gua hingga ia tumbuh besar dengan perlindungan Allah. Sejak kecil, Nabi Ibrahim telah menunjukkan tanda-tanda kebijaksanaan dan ketauhidan yang tinggi. Ia menolak menyembah patung-patung buatan ayahnya, Azar, dan mempertanyakan kepercayaan kaumnya terhadap benda mati yang tidak dapat memberi manfaat maupun mudarat. Dalam perjalanan spiritualnya, Ibrahim mencari Tuhan yang sesungguhnya hingga Allah memberikan petunjuk kepadanya. Dengan penuh kesabaran, ia berdakwah kepada ayah dan kaumnya agar meninggalkan berhala dan hanya menyembah Allah. Namun, dakwahnya ditolak dan ia dijatuhi hukuman dibakar hidup-hidup oleh Raja Namrud. Atas kehendak Allah, api yang membakar Nabi Ibrahim menjadi dingin dan membawa keselamatan baginya, sebagai bukti kekuasaan Allah atas segala sesuatu. Kisah Nabi Ibrahim menjadi simbol keimanan yang kokoh, keberanian dalam menegakkan kebenaran, serta ketulusan dalam beribadah hanya kepada Allah semata.
''';
      case 'Nabi Yunus AS':
        return '''
Nabi Yunus AS adalah salah satu nabi Allah SWT yang kisahnya sarat dengan pelajaran tentang kesabaran, ketulusan, dan keikhlasan dalam menghadapi ujian. Beliau diutus kepada kaum Ninawa (sekarang wilayah Irak) untuk menyeru mereka agar menyembah Allah SWT dan meninggalkan penyembahan berhala. Namun, kaum Yunus menolak dakwahnya dan tetap dalam kesesatan. Karena merasa kecewa dan marah, Nabi Yunus meninggalkan kaumnya sebelum mendapat izin dari Allah SWT. Keputusan tergesa-gesa ini menjadi awal dari ujian besar dalam hidupnya. Setelah meninggalkan kaumnya, Nabi Yunus naik ke sebuah kapal. Namun di tengah laut, kapal yang ditumpanginya diterpa badai besar. Para penumpang memutuskan untuk mengurangi beban kapal dengan membuang seseorang ke laut, dan melalui undian, nama Nabi Yunus terpilih sebanyak tiga kali berturut-turut. Dengan penuh kesadaran, Nabi Yunus akhirnya melompat ke laut, lalu ditelan oleh seekor ikan besar (dalam sebagian tafsir disebut paus) atas kehendak Allah SWT. Di dalam perut ikan, Nabi Yunus menyadari kesalahannya karena meninggalkan kaumnya tanpa izin Allah. Dalam keadaan gelap gulita, di dasar laut, dan di dalam perut ikan, beliau berdoa dengan penuh penyesalan, “Laa ilaaha illa anta subhaanaka inni kuntu minazh-zhaalimiin” (Tidak ada Tuhan selain Engkau, Maha Suci Engkau, sesungguhnya aku termasuk orang-orang yang zalim). Doa inilah yang kemudian dikenal sebagai doa Nabi Yunus dan menjadi simbol tobat serta kerendahan hati. Allah SWT mendengar doa Nabi Yunus dan menerima tobatnya. Ikan besar itu kemudian memuntahkan Nabi Yunus ke daratan. Beliau pun diselamatkan dan diberi kehidupan kembali hingga pulih kesehatannya. Setelah itu, Allah memerintahkannya untuk kembali kepada kaumnya di Ninawa. Ketika beliau kembali, kaumnya sudah bertobat dan beriman kepada Allah SWT setelah menyadari kesalahan mereka.
''';
      case 'Nabi Yusuf AS':
        return '''
Nabi Yusuf AS adalah putra ketujuh dari Nabi Yaqub AS yang memiliki dua belas anak, dan kisah hidupnya penuh ujian serta pelajaran berharga. Salah satu ujian berat yang dialaminya adalah ketika ia dibuang ke dalam sumur oleh saudara-saudaranya karena rasa iri dan cemburu, sebagaimana dikisahkan dalam surah Yusuf ayat 7–21. Mereka merasa bahwa ayah mereka lebih mencintai Yusuf dan Bunyamin, sehingga mereka membuat tipu daya dengan melumuri baju Yusuf dengan darah dan berpura-pura bahwa ia dimakan serigala. Nabi Yaqub sangat berduka mendengar kabar tersebut hingga matanya menjadi buta karena menangis terlalu lama, namun tetap bersabar dan berserah diri kepada Allah SWT. Sementara itu, Nabi Yusuf tetap berdoa dan bertawakal di dalam sumur hingga akhirnya ditemukan oleh para musafir dari negeri Syam yang kemudian menjualnya sebagai budak di Mesir kepada seorang menteri bernama Qitfir Al-Aziz. Meskipun dijual dengan harga murah, kejadian itu merupakan bagian dari rencana Allah SWT untuk mengangkat derajat Nabi Yusuf di kemudian hari menjadi orang berilmu, berwibawa, dan berkuasa di Mesir. Kisah ini menunjukkan bahwa di balik setiap ujian selalu ada hikmah dan kemudahan bagi orang yang sabar dan bertawakal, sebagaimana firman Allah dalam surah Yusuf ayat 111, bahwa kisah para nabi adalah pelajaran bagi orang-orang berakal dan menjadi petunjuk serta rahmat bagi kaum yang beriman.
''';
      case 'Nabi Daud AS':
        return '''
Nabi Daud AS adalah salah satu dari 25 nabi dan rasul yang wajib diimani umat Islam, dikenal sebagai sosok yang saleh, pemberani, dan rendah hati. Sejak muda, ia menunjukkan keberaniannya ketika berhasil mengalahkan Raja Jalut yang bertubuh besar hanya dengan ketapel dan batu kecil, membuktikan bahwa dengan pertolongan Allah, kekuatan bukanlah segalanya. Selain itu, kisahnya bersama seekor ulat merah mengajarkan pentingnya kerendahan hati dan kesadaran bahwa semua makhluk memiliki peran dan nilai di mata Allah SWT. Nabi Daud juga menerima mukjizat luar biasa, di antaranya kitab Zabur yang diturunkan kepadanya, kemampuan berbicara dengan burung, dan suara yang sangat merdu yang digunakannya untuk bertasbih memuji Allah. Dari kisah Nabi Daud, umat Islam diajarkan untuk selalu berani, bersyukur, tidak sombong, serta senantiasa percaya bahwa Allah akan menolong hamba-Nya yang beriman dan bertakwa.
''';
      case 'Nabi Sulaiman AS':
        return '''
Nabi Sulaiman AS adalah salah satu dari 25 nabi Allah SWT yang terkenal karena kebijaksanaan, kecerdasan, dan keadilannya. Beliau merupakan putra dari Nabi Daud AS dan sejak kecil sudah menunjukkan kesalehan serta ketaatan kepada Allah. Dikenal sebagai raja yang adil, Nabi Sulaiman mewarisi kerajaan ayahnya dan memimpin dengan penuh kebijaksanaan tanpa kesombongan. Kisahnya yang terkenal adalah pertemuannya dengan Ratu Balqis dari negeri Saba melalui perantara burung hud-hud, yang akhirnya membawa Ratu Balqis untuk beriman kepada Allah SWT. Nabi Sulaiman juga diberi banyak mukjizat oleh Allah, seperti kemampuan berbicara dengan hewan, menundukkan angin, serta memerintah jin dan setan untuk menjalankan tugasnya. Wafatnya pun unik, yaitu saat beliau duduk di atas kursinya dan baru diketahui setelah tongkatnya dimakan rayap. Dari kisahnya, kita belajar tentang pentingnya kebijaksanaan, keadilan, kerendahan hati, dan ketaatan kepada Allah SWT dalam setiap aspek kehidupan.
''';
      case 'Nabi Adam AS':
        return '''
Nabi Adam AS adalah manusia pertama yang diciptakan oleh Allah SWT dari segenggam tanah yang diambil dari berbagai bagian bumi, sehingga keturunannya pun memiliki beragam warna kulit, sifat, dan karakter. Setelah diciptakan, Allah memerintahkan seluruh makhluk di surga untuk bersujud kepada Nabi Adam sebagai bentuk penghormatan, namun iblis menolak karena merasa lebih mulia, sehingga ia dikutuk dan diusir dari surga. Sebagai bentuk dendam, iblis berjanji akan menyesatkan Nabi Adam dan keturunannya hingga hari kiamat. Agar Nabi Adam tidak hidup seorang diri, Allah menciptakan Siti Hawa dari salah satu tulang rusuknya untuk menjadi pendamping. Keduanya hidup bahagia di surga dengan berbagai kenikmatan, namun dilarang memakan buah dari pohon khuldi. Iblis kemudian menggoda mereka hingga melanggar perintah Allah dengan memakan buah terlarang itu. Menyadari kesalahannya, Nabi Adam dan Siti Hawa bertaubat dengan penuh penyesalan, dan Allah menerima taubat mereka. Sebagai konsekuensinya, mereka diturunkan ke bumi untuk hidup dan berkembang biak sebagai manusia. Kisah Nabi Adam menjadi pelajaran besar bahwa manusia asalnya adalah penghuni surga, sehingga tujuan akhir kehidupan adalah kembali ke surga dengan ketaatan dan taubat kepada Allah SWT.
''';
      default:
        return 'Kisah dari $nama belum tersedia.';
    }
  }
}
