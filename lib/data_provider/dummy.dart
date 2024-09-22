// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation

import 'package:book_library/models/book_model.dart';
import 'package:book_library/models/enum.dart';
import 'package:book_library/models/user_model.dart';

class Dummy {
  static List<UserModel> users = [];
  static List<BookModel> books = [
    BookModel(
        imageUrl: 'assets/01.jpg',
        bookId: '01',
        title: 'Teruslah Bodoh, Jangan Pintar',
        author: 'Tere Liye',
        isbn: '6238882204',
        penerbit: '	Sabakgrip',
        description:
            'Saat hukum dan kekuasaan dipegang oleh serigala-serigala buas berbulu domba, saat seluruh segeri dikangkangi orang-orang jualan sok sedeharna tapi sejatinya serakah.' +
                ' Apakah kalian akan tutup mata, tutup mulut, tidak peduli dengan apa yang terjadi? Atau kalian akan mengepalkan tangan ke udara, LAWAN!',
        category: Category.fiksi,
        availability: Availability.borrowed),
    BookModel(
      imageUrl: 'assets/02.jpg',
      bookId: '02',
      title: 'SENDIRI',
      author: 'Tere Liye',
      isbn: '623888228X',
      penerbit: 'Sabakgrip',
      description: 'Tidak ada yang abadi di dunia ini. Lautan bisa mengering. Gunung bisa rata. Benua terpisah, bersatu, dan terpisah lagi. Apalagi cinta pasangan manusia. ' +
          'Sehebat apapun cinta tersebut, pasti akan berakhir. Waktu akan menelannya. Inilah kisah tentang seorang laki-laki usia 70 tahun, ' +
          'yang ditinggal istrinya meninggal setelah begitu lama menikah, menghabiskan waktu bersama-sama. Saat hari itu tiba, apa yang harus dia lakukan? ' +
          'Bagaimana dia akan melewati sisa hidupnya? Menjalani hari demi hari? Apakah hidupnya masih seru? Apakah masih ada petualangan spesial baginya. Atau hanya tersisa. ' +
          'Sendiri.',
      category: Category.fiksi,
      availability: Availability.available,
    ),
    BookModel(
        imageUrl: 'assets/03.jpg',
        bookId: '03',
        title: 'K Si Pemalas',
        author: 'Tere Liye',
        isbn: '6238882247',
        penerbit: 'Sabakgrip',
        description: 'Apakah kalian tahu koala? Ssst, koala adalah hewan yang sangat suka tidur. Seekor koala bisa tidur selama 16-20 jam.' +
            'Tapi K, seekor koala remaja, dia bisa tidur 22 jam sehari. Aduh, berarti dia hanya bangun selama dua jam saja. Suatu hari,' +
            'karena terlalu asyik tidur, K terjebak dalam masalah serius. Dia terpisah dari Mama dan Papanya. Dan hutan tempatnya tinggal terancam. ' +
            'Maka mulailah petualangan K. Ditemani oleh Walbi, seekor walabi, mereka dikejar oleh anjing galak dan petugas.' +
            ' Apakah K berhasil kembali bertemu dengan Mama dan Papa? Apakah K bisa menyelamatkan hutan lebat tempat tinggalnya? Inilah petualangan K, si Pemalas.',
        category: Category.fiksi,
        availability: Availability.available),
    BookModel(
        imageUrl: 'assets/04.jpg',
        bookId: '04',
        title: 'Suku Penunggang Layang-layang',
        author: 'Tere Liye',
        isbn: '6238882271',
        penerbit: 'Sabakgrip',
        description: 'Tetukong adalah anak penggembala ternak. Persis pada ulang tahunnya yang ke-12, ia harus melewati ujian yang penting sekali bagi sukunya.' +
            ' Apa itu? Menunggang layang-layang! Wah, suku mereka hebat sekali. Mereka tidak menggiring ternak dengan cara biasa, melainkan dengan menaiki layang-layang besar.' +
            ' Sayangnya, Tetukong punya rahasia yang membuatnya kesulitan melewati ujian tersebut. Tapi ia ingin sekali bisa terbang di udara, menaiki layang-layang, ' +
            'bersama teman-temannya. Apakah Tetukong berhasil? Selamat membaca kisah tentang menaklukkan rasa takut. Sungguh tidak apa merasa takut, ' +
            'asal kita terus melangkah maju. Mencoba mencari cara mengatasinya.',
        category: Category.fiksi,
        availability: Availability.available),
    BookModel(
      imageUrl: 'assets/05.jpg',
      bookId: '05',
      title: 'Malam yang Menegangkan',
      author: 'Tere Liye',
      isbn: '6238882212',
      penerbit: 'Sabakgrip',
      description: 'description',
      category: Category.fiksi,
      availability: Availability.available,
    ),
    BookModel(
      imageUrl: 'assets/06.jpg',
      bookId: '06',
      title: 'Apel Emas',
      author: 'Tere Liye',
      isbn: '	6238882255',
      penerbit: 'Sabakgrip',
      description: 'Tahukah kalian buah paling berharga di seluruh muka Bumi? Jawabannya adalah: Apel Emas. Apel Emas adalah mahkota seluruh buah.' +
          'Raja dari raja segala jenis buah. Bentuknya seperti apel biasa, tapi warnanya emas. Sebutir apel emas tidak hanya mengenyangkan,' +
          'tapi juga menyembuhkan penyakit apapun yang diderita manusia. Dan jika orang yang memakannya tidak sedang sakit, mengunyah apel emas' +
          'akan memberikan rasa bahagia, damai, serta tenteram. Tapi Apel Emas tidak sembarang tumbuh. ' +
          'Dia adalah hasil perjuangan sekelompok manusia yang yang amat menyayangi hutan, sungai, dan danau. Tidak merusaknya. Apakah kau juga mau menikmati Apel Emas?' +
          'Jika demikian, mari kita sayangi lingkungan sekitar.',
      category: Category.fiksi,
      availability: Availability.available,
    ),
    BookModel(
      bookId: '07',
      imageUrl: 'assets/07.jpg',
      title: 'MEMAHAMI HAMKA The Untold Stories',
      author: 'Haidar Musyafa',
      isbn: '6027926503',
      penerbit: 'Pustaka Ilman',
      description:
          'Hamka adalah pribadi yang sangat luas, baik jiwa maupun pemikirannya. Maka itu, melihat Hamka hanya dari satu sisi seringkali melahirkan salah persepsi. Dia bukanlah sosok yang terlalu keras atau terlalu lembek. Dia di tengah-tengah saja dan fleksibel. Dengan begitu, Hamka bisa masuk ke dalam wilayah sosial-kemasyarakatan lapisan manapun. Apa yang dilakukannya jauh dari kepentingan pribadi karena persatuan bangsa dan keutuhan umat Islam lebih utama baginya. Sampai-sampai, K.H. Abdurrahman Wahid (Gus Dur) dalam buku Hamka Di Mata Hati Umat memuji sosok Hamka: “Jika ingin dirumuskan secara bersahaja, letak kebesaran Buya Hamka adalah pada kemampuannya menjadikan diri berharga dan berarti bagi aneka ragam manusia melalui sikap yang sangat positif dan konstruktif. Ia menghargai manusia lain secara tulus.”',
      category: Category.biografi,
      availability: Availability.available,
    ),
    BookModel(
      bookId: '08',
      imageUrl: 'assets/08.jpg',
      title: 'Hadji Agus Salim ',
      author: 'Haidar Musyafa',
      isbn: '6027926481',
      penerbit: 'Mizan',
      description: 'Hadji Agus Salim adalah sosok diplomat yang sangat cerdik, antiminder, dan pendebat ulung yang pernah dimiliki Republik ini. Seorang jenius yang sangat kritis, ' +
          'ulama moderat, sumur intelektual dan kearifan. Pantas jika Bung Hatta memberikan sanjungan, “Sikapnya yang tangkas itu memberikan garam dalam ucapannya. ' +
          'Biasanya terdapat dalam perdebatan atau tulisan yang menangkis serangan lawan atau dalam pertukaran pikiran yang berisikan lelucon. Di situlah terdapat apa yang ' +
          'dikatakan orang dalam bahasa Belanda: Salim op zijn best.” Prof. Schermerhorn mengakui kecemerlangan intelektual Agus Salim, seperti dikutip sejarawan Asvi Warman Adam' +
          ' (2004), Schermerhorn pernah berujar, “Orang tua yang sangat pandai ini seorang genius dalam bidang bahasa, mampu berbicara dan menulis dengan sempurna dalam paling ' +
          'sedikit sembilan bahasa, mempunyai hanya satu kelemahan, yaitu selama hidupnya melarat.”',
      category: Category.biografi,
      availability: Availability.available,
    ),
    BookModel(
      bookId: '09',
      imageUrl: 'assets/09.jpg',
      title: 'Indonesia Tidak Pernah Dijajah',
      author: 'BATARA R. HUTAGALUNG',
      isbn: '	602163425X',
      penerbit: '	Matapadi pressindo',
      description: '-',
      category: Category.sejarah,
      availability: Availability.available,
    ),
    BookModel(
        bookId: '10',
        imageUrl: 'assets/10.jpg',
        title:
            'Range: Mengapa Menguasai Beragam Bidang Bisa Membuat Kita Unggul di Dunia yang Semakin Khusus',
        author: 'David Epstein',
        isbn: '602063776X',
        penerbit: 'Gramedia Pustaka Utama',
        description: 'Apa jalan yang paling efektif untuk meraih kesuksesan pada setiap hal? Jawabannya bukan seperti yang Anda kira. Banyak ahli berpendapat siapa pun yang ingin ' +
            'mengembangkan keahlian, memainkan alat musik, atau memimpin di lapangan harus mulai menekuninya sejak dini, berfokus secara intens, dan sengaja berlatih sebanyak ' +
            'mungkin. Jika terlambat melakukannya, Anda tidak akan pernah bisa mengejar mereka yang menekuni bidang itu lebih awal. Namun, penelitian secara lebih mendalam ' +
            'terhadap orang-orang yang paling unggul di bidangnya—dari atlet profesional sampai peraih Nobel—menunjukkan bahwa pengkhususan bidang sejak dini adalah pengecualian, ' +
            'bukan aturan. David Epstein meneliti atlet, seniman, musisi, penemu, peramal, dan ilmuwan paling sukses di dunia. Ia menemukan bahwa di sebagian besar bidang—terutama ' +
            'yang kompleks dan tak terduga—yang lebih unggul adalah generalis, bukan spesialis. Generalis sering kali terlambat menemukan jalur mereka dan mencoba banyak bidang, ' +
            'bukannya berfokus pada satu bidang. Mereka juga lebih kreatif, lebih gesit, dan mampu membuat kaitan-kaitan yang tidak bisa dilihat oleh para spesialis. ' +
            'Provokatif, mendetail, dan mengasyikkan, Range menyajikan gagasan yang menarik tentang secara aktif mengolah ketidakefisienan. Gagal adalah cara terbaik untuk belajar. ' +
            'Orang yang sering mengalami kegagalan pada akhirnya memiliki karier yang paling memuaskan. Para penemu yang paling berdampak mempelajari berbagai bidang, bukan hanya ' +
            'memperdalam pengetahuan di satu bidang tertentu. Ketika sejumlah pakar mengotak-ngotakkan keahlian, sementara komputer memiliki kemampuan lebih banyak bila dioperasikan ' +
            'oleh orang-orang yang sangat berfokus, orang yang berpikir secara luas serta merangkul keberagaman pengalaman dan perspektif akan semakin berkembang. “Range adalah buku ' +
            'yang krusial dan penting; bacaan wajib bagi pemimpin, orangtua, pelatih, dan siapa saja yang peduli dengan peningkatan kinerja.” —Daniel H. Pink, penulis When dan Drive ' +
            '“Pembahasan yang ditulis dengan baik dan didukung dengan fakta tentang orang-orang yang terlambat mulai…. Seperti ditunjukkan oleh David Epstein, memupuk keragaman ' +
            'menyiapkan kita menghadapi hal yang tak terduga.” —Wall Street Journal “Menghabiskan berjam-jam ditemani penulis seberbakat David Epstein adalah kebahagiaan. ' +
            'Dan kebahagiaan ini bertambah saat dia berbagi begitu banyak informasi penting dan inspiratif tentang kinerja, keberhasilan, serta pendidikan.” —Susan Cain, penulis Quiet',
        category: Category.nonFiksi,
        availability: Availability.available)
  ];
}
