Nama : Nayla Putri Novita
NPM : 2506657182
Kelas : PBP A

### Tugas 7

1. **Apa yang dimaksud dengan *widget tree* pada Flutter dan bagaimana hubungan induk-anak (*parent-child*) bekerja antar-widget?**

   Di Flutter, hampir seluruh elemen antarmuka yang tampil di layar aplikasi adalah widget, mulai dari tulisan, ikon, tombol, sampai pengatur jarak dan tata letak. Semua widget tersebut disusun secara bertingkat membentuk struktur pohon hierarki yang disebut *widget tree*. Struktur pohon ini menggambarkan bagaimana satu widget membungkus widget lainnya dari level terluar aplikasi hingga komponen paling kecil di dalamnya.

   Hubungan induk anak (*parent-child*) di dalam *widget tree* bekerja dengan alur *constraints go down, sizes go up, parent sets position*. Pertama, widget induk (*parent*) memberikan batasan ukuran maksimal dan minimal ke bawah menuju widget anak (*child*). Setelah menerima batasan itu, widget anak menentukan ukurannya sendiri sesuai kebutuhan lalu melaporkannya kembali ke induk. Terakhir, barulah widget induk menempatkan posisi anak tersebut di layar misalnya dijajarkan ke samping oleh `Row`, disusun ke bawah oleh `Column`, atau diletakkan di tengah oleh `Center`. Dengan struktur pohon ini, ketika ada perubahan data, Flutter hanya perlu membangun ulang cabang widget yang terdampak saja tanpa merender ulang seluruh layar.

2. **Semua widget yang digunakan dalam proyek ini beserta fungsinya masing-masing:**

   Pada proyek `myportofolio_mobile` ini, bagian terluar dimulai dari `MyApp` sebagai root widget aplikasi yang membungkus `MaterialApp`. Widget `MaterialApp` berfungsi mengatur tema warna global aplikasi (`ThemeData`), judul aplikasi, serta konfigurasi dasar desain Material Design. Di dalamnya terdapat halaman utama `MyHomePage` yang memakai `Scaffold` sebagai kerangka dasar halaman untuk menampung bilah judul di bagian atas berupa `AppBar` beserta teks judul menggunakan widget `Text`, serta area isi konten utama pada properti `body`.

   Di dalam `body`, saya menggunakan `Padding` untuk memberi jarak antara konten dengan tepi layar agar tidak terlalu mepet, lalu menyusun elemen-elemennya ke bawah menggunakan `Column`. Untuk menampilkan kartu identitas mahasiswa secara sejajar ke samping, saya menggunakan `Row` yang berisi tiga custom widget `InfoCard`. Masing-masing `InfoCard` tersusun dari `Card` untuk memberi tampilan kartu dengan efek bayangan, `Container` untuk mengatur lebar kartu serta padding dalam, `Column` untuk menyusun isi secara vertikal, `Text` untuk judul dan isi data, serta `SizedBox` untuk memberi jarak spasi kosong di antara keduanya.

   Di bawah bagian profil, saya menggunakan `Center` untuk menengahkan teks sambutan dan susunan tombol menu. Daftar tombol menu ditata dalam bentuk kisi tiga kolom menggunakan `GridView.count` yang berisi tiga custom widget `ItemCard`. Setiap `ItemCard` dibangun memakai `Material` agar bisa memiliki warna latar belakang unik per item dan sudut yang melengkung, dibungkus `InkWell` supaya kartu dapat ditekan sekaligus memunculkan efek riak sentuhan dan memicu notifikasi `SnackBar` di bawah layar saat diklik. Bagian dalam kartu tombol tersebut menggunakan `Container`, `Center`, dan `Column` untuk menata `Icon` simbol tombol, `Padding` sebagai jarak pemisah, serta `Text` untuk label nama tombolnya.

3. **Fungsi widget `MaterialApp` dan alasan umumnya digunakan sebagai *root widget* pada aplikasi Flutter:**

   Widget `MaterialApp` berfungsi sebagai pembungkus utama yang menyiapkan seluruh konfigurasi dan fitur dasar berstandar Material Design milik Google. Melalui widget ini, kita dapat mengatur skema tema warna aplikasi secara global, mendaftarkan rute navigasi antar-halaman, mengatur orientasi arah teks (*Directionality*), serta menyediakan lokalisasi bahasa bagi aplikasi.

   `MaterialApp` hampir selalu diletakkan di bagian paling atas sebagai *root widget* karena sebagian besar widget Material bawaan Flutter seperti `Scaffold`, `AppBar`, `Card`, `SnackBar`, dan pemanggilan tema lewat `Theme.of(context)` bergantung pada keberadaan konfigurasi dari leluhurnya di atas pohon widget. Jika `MaterialApp` tidak ada di pucuk teratas, widget widget Material di bawahnya tidak memiliki acuan tema maupun arah tata letak sehingga aplikasi akan memunculkan error saat dijalankan.

4. **Perbedaan antara `StatelessWidget` dan `StatefulWidget`, serta kapan sebaiknya memilih masing-masing:**

   Perbedaan mendasar antara keduanya terletak pada kemampuan menyimpan dan mengubah keadaan data (*state*) saat aplikasi berjalan. `StatelessWidget` bersifat statis dan tidak bisa berubah dari dalam dirinya sendiri setelah dirender ke layar jika tampilannya perlu diubah, widget induknya harus membangun ulang widget tersebut dengan data kiriman yang baru. Sebaliknya, `StatefulWidget` bersifat dinamis karena memiliki objek `State` terpisah yang nilainya dapat berubah selama aplikasi aktif, misalnya melalui pemanggilan fungsi `setState()` untuk menggambar ulang bagian UI yang berubah saja.

   Kita sebaiknya memilih `StatelessWidget` ketika komponen atau halaman hanya menampilkan informasi yang sifatnya tetap dan tidak berubah akibat interaksi internal di halaman tersebut, contohnya label teks, kartu identitas profil pada halaman utama portofolio ini, atau tombol menu statis. Sementara itu, `StatefulWidget` tepat dipilih ketika tampilan perlu mengelola data yang berubah secara langsung saat pengguna berinteraksi, seperti formulir input teks, kotak centang (*checkbox*), saklar *toggle*, animasi, atau penghitung angka yang nilainya terus diperbarui.

5. **Apa itu `BuildContext`, mengapa penting di Flutter, dan bagaimana penggunaannya dalam metode `build`?**

   `BuildContext` adalah sebuah objek penanda yang merepresentasikan lokasi atau posisi spesifik suatu widget di dalam susunan *widget tree*. Karena setiap widget menempati letak yang berbeda-beda di dalam hierarki pohon, setiap widget memiliki `BuildContext`-nya masing-masing.

   Keberadaan `BuildContext` sangat penting karena menjadi penghubung bagi sebuah widget untuk mengenali lingkungan sekitarnya dan mengakses data atau konfigurasi dari widget induk di atasnya. Di dalam metode `build(BuildContext context)`, Flutter secara otomatis mengirimkan parameter `context` tersebut agar bisa langsung kita gunakan di dalam kode. Sebagai contoh pada aplikasi ini, saya menggunakan `context` untuk mengambil warna tema utama lewat `Theme.of(context)`, mengukur lebar layar perangkat dengan `MediaQuery.of(context).size.width` supaya ukuran `InfoCard` bisa menyesuaikan layar, serta memanggil `ScaffoldMessenger.of(context)` untuk menampilkan notifikasi `SnackBar` saat tombol ditekan.

6. **Konsep *hot reload* di Flutter, perbedaannya dengan *hot restart*, serta kapan kita harus melakukan *hot restart* atau *full restart*:**

   *Hot reload* adalah fitur pada Flutter yang memungkinkan kita melihat perubahan kode terutama perubahan tampilan di dalam metode `build`secara instan di layar tanpa mematikan aplikasi dan tanpa menghilangkan *state* atau data yang sedang aktif. Cara kerjanya adalah dengan menyuntikkan perubahan kode terbaru langsung ke dalam *Dart Virtual Machine* yang sedang berjalan. Berbeda dengan itu, *hot restart* memuat ulang aplikasi dari awal dengan cara menghapus seluruh *state* yang tersimpan di memori dan memulai eksekusi ulang dari fungsi `main()`.

   Walaupun *hot reload* sangat cepat dan praktis, ada beberapa kondisi di mana kita tidak bisa hanya mengandalkannya dan perlu melakukan *hot restart* atau bahkan *full restart*. Hal tersebut terjadi saat kita mengubah isi fungsi `main()`, mengubah nilai awal variabel global maupun variabel statis, atau mengubah struktur kelas dan konstruktor yang memengaruhi *state* yang sudah teralokasi sebelumnya. Selain itu, apabila kita baru menambahkan aset baru seperti gambar dan font atau mendaftarkan paket dependensi baru pada berkas `pubspec.yaml`, kita wajib menghentikan dan menjalankan ulang aplikasi secara penuh (*full restart*) agar aset atau pustaka baru tersebut ikut dikompilasi ke dalam aplikasi.

**Penggunaan AI:**
Selama mengerjakan Tugas 7 ini, saya berdiskusi dengan Google Gemini untuk memperdalam pemahaman saya tentang konsep dasar Flutter dan Dart, mengingat materi ini baru saja masuk di paruh kedua semester. Topik yang saya diskusikan meliputi cara kerja *widget tree* dan aturan ukuran *parent-child*, alasan mengapa `MaterialApp` dipakai di posisi paling atas, perbedaan `StatelessWidget` dan `StatefulWidget`, peran `BuildContext`, serta batas kemampuan *hot reload* dibandingkan *hot restart*. Selain itu, saya juga berdiskusi mengenai desain kode yang rapi pada model `ItemHomepage` dan `ItemCard` agar setiap tombol punya warna yang berbeda tanpa banyak percabangan. Semua perubahan kode pada `lib/menu.dart`, uji coba di Google Chrome, pemeriksaan lewat `flutter analyze`, serta jawaban refleksi pada `README.md` ini tetap saya pelajari, pahami alurnya, dan verifikasi sendiri.

* **Tautan Bukti Percakapan AI (Gemini):** [Riwayat Diskusi Konsep Tugas 7 di Google Gemini](https://share.gemini.google/b5zUgIf5JGhI)

---

### Tugas 8

1. **Jelaskan perbedaan antara `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()`:**

   Flutter mengelola transisi dan riwayat perpindahan layar menggunakan struktur data tumpukan (*stack*) yang diatur oleh widget `Navigator`. Perbedaan ketiga metode tersebut adalah:
   - **`Navigator.push()`**: Menambahkan rute (*route*) baru ke bagian paling atas tumpukan (*stack*). Rute halaman sebelumnya tetap tersimpan di dalam memori di bawah halaman baru. Karena halaman sebelumnya masih ada di tumpukan, Flutter secara otomatis memunculkan tombol kembali (*back arrow*) pada `AppBar` halaman baru sehingga pengguna dapat kembali ke halaman sebelumnya kapan saja. Contoh pada tugas ini: membuka halaman `ProjectFormPage` atau `ExperienceFormPage` dari tombol kartu menu di beranda.
   - **`Navigator.pushReplacement()`**: Menambahkan rute baru ke tumpukan sekaligus menghapus (*replace*) rute halaman yang sedang aktif dari puncak tumpukan. Dengan metode ini, pengguna tidak dapat kembali ke halaman sebelumnya menggunakan tombol kembali karena rute lamanya sudah dibuang dari stack. Contoh pada tugas ini: opsi "Halaman Utama" pada menu *drawer* menggunakan `pushReplacement()` agar tidak terjadi penumpukan rute beranda berulang-ulang di memori navigasi aplikasi.
   - **`Navigator.pop()`**: Menghapus atau mengeluarkan (*pop*) rute halaman yang berada di puncak tumpukan saat ini, sehingga antarmuka kembali menampilkan halaman yang berada tepat di bawahnya. Contoh pada tugas ini: digunakan pada tombol "OK" di dalam dialog pop-up `AlertDialog` untuk menutup dialog setelah pengguna selesai membaca ringkasan data yang baru dimasukkan.

2. **Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi *Home* di *drawer* membawa pengguna kembali ke halaman utama:**

   - **Metode untuk membuka formulir dari kartu aksi**:
     Pada widget kartu aksi `ItemCard` (`lib/widgets/project_card.dart`), kita menggunakan metode `Navigator.push()` dengan `MaterialPageRoute`:
     ```dart
     Navigator.push(
       context,
       MaterialPageRoute(
         builder: (context) => const ExperienceFormPage(),
       ),
     );
     ```
     Metode ini menaruh halaman formulir di atas halaman utama dalam tumpukan navigasi, memungkinkan pengguna mengisi formulir dengan nyaman dan memiliki tombol kembali otomatis di pojok kiri atas bilah judul.
   - **Cara opsi *Home* di *drawer* membawa pengguna kembali ke halaman utama**:
     Di dalam widget `LeftDrawer` (`lib/widgets/left_drawer.dart`), opsi menu "Halaman Utama" menggunakan `Navigator.pushReplacement()`:
     ```dart
     Navigator.pushReplacement(
       context,
       MaterialPageRoute(
         builder: (context) => MyHomePage(),
       ),
     );
     ```
     Ketika pengguna sedang berada di halaman formulir dan ingin kembali ke beranda melalui drawer, `pushReplacement()` akan membuang rute halaman formulir saat itu dan menggantikannya dengan halaman `MyHomePage`. Hal ini menjaga tumpukan navigasi tetap bersih, efisien, dan mencegah tumpukan halaman beranda yang tak terbatas (*infinite back stack*).

3. **Bagaimana susunan `Scaffold`, `AppBar`, dan `Drawer` membantu menjaga struktur halaman tetap konsisten:**

   - **`Scaffold`** berperan sebagai kerangka dasar (*scaffolding*) arsitektur antarmuka berstandar Material Design. `Scaffold` menyediakan slot struktural yang konsisten untuk menempatkan komponen-komponen utama aplikasi, seperti `appBar`, `drawer`, dan `body`.
   - **`AppBar`** menyajikan bilah navigasi atas yang seragam di setiap halaman. Ketika properti `drawer` disematkan pada `Scaffold`, `AppBar` secara otomatis menampilkan tombol ikon navigasi laci (ikon *hamburger* / menu garis tiga) di sisi kiri atas tanpa memerlukan konfigurasi tambahan.
   - **`Drawer`** menyediakan panel menu geser samping yang konsisten untuk seluruh halaman aplikasi. Dengan menyematkan custom widget `LeftDrawer` yang sama pada `MyHomePage`, `ProjectFormPage`, dan `ExperienceFormPage`, pengguna mendapatkan menu navigasi samping yang identik di mana pun mereka berada di dalam aplikasi.

   Kombinasi ketiga widget ini memastikan konsistensi pengalaman pengguna (*user experience*), keseragaman tata letak visual (*visual layout consistency*), serta struktur alur navigasi yang kokoh dan mudah dipahami di seluruh penjuru aplikasi mobile.

4. **Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman:**

   Aplikasi ini mendefinisikan skema tema warna secara terpusat pada `ThemeData` di berkas `lib/main.dart` dengan konfigurasi:
   ```dart
   theme: ThemeData(
     colorScheme: ColorScheme.fromSeed(
       seedColor: Colors.indigo,
     ).copyWith(
       secondary: Colors.amber[700],
     ),
     useMaterial3: true,
   ),
   ```
   Warna tema primer (*primary color*) ini kemudian digunakan secara konsisten di berbagai halaman berbeda melalui pemanggilan `Theme.of(context).colorScheme.primary`:
   - Pada **`MyHomePage`** (`lib/screens/menu.dart`): digunakan sebagai warna latar belakang bilah judul `AppBar`.
   - Pada **`ProjectFormPage`** (`lib/screens/project_form.dart`): digunakan sebagai warna latar belakang `AppBar` dan warna latar belakang tombol simpan (`ElevatedButton`).
   - Pada **`ExperienceFormPage`** (`lib/screens/experience_form.dart`): digunakan sebagai warna latar belakang `AppBar` dan tombol `ElevatedButton`.
   - Pada **`LeftDrawer`** (`lib/widgets/left_drawer.dart`): digunakan sebagai warna latar belakang `DrawerHeader`.

   Penerapan warna tema terpusat ini menjamin keselarasan visual aplikasi secara menyeluruh dan mempermudah pemeliharaan kode (cukup mengubah `seedColor` di `main.dart`, seluruh halaman akan ikut berubah secara otomatis).

5. **Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas:**

   - **Alasan pemilihan tata letak formulir**: Formulir disusun menggunakan widget `Column` di dalam widget `Form`. Tata letak vertikal ini dipilih karena mencerminkan alur baca dan pengisian data manusia yang alami dari atas ke bawah (dimulai dari pengisian judul, pemilihan kategori, pengisian deskripsi, penyertaan tautan, hingga penekanan tombol simpan di bagian bawah).
   - **Peran widget pengatur jarak (`Padding` dan `SizedBox`)**: `Padding` dan `SizedBox` berfungsi menciptakan batas ruang kosong (*whitespace*) yang proporsional di sekeliling formulir dan di antara setiap kolom input. Pengaturan jarak ini mencegah elemen-elemen form menempel rapat satu sama lain, memberikan pemisahan visual yang jelas antarelemen, dan meningkatkan kenyamanan serta keterbacaan antarmuka (*ergonomic user interface*).
   - **Peran widget penggulir (`SingleChildScrollView`)**: Pada perangkat bergerak (*mobile*), ketika pengguna mengetuk kolom teks, papan ketik virtual (*soft keyboard*) akan muncul dari bawah layar dan menyita lebih dari setengah tinggi layar tampilan. Tanpa widget penggulir, ruang vertikal yang tersisa tidak cukup untuk menampung seluruh elemen formulir sehingga memicu kesalahan *render overflow* (layar bergaris kuning-hitam). Dengan membungkus form di dalam `SingleChildScrollView`, seluruh isi formulir dapat digulir ke atas dan ke bawah dengan lancar, memungkinkan pengguna menjangkau seluruh field dan tombol simpan meskipun ruang layar sedang sangat terbatas.

6. **Apa peran `GlobalKey<FormState>`, `validator`, dan `validate()` saat tombol *Simpan* ditekan:**

   - **`GlobalKey<FormState>`**: Berperan sebagai pengenal unik global yang memegang kendali referensi langsung terhadap status internal (`State`) dari widget `Form`. Kunci ini memungkinkan kita mengakses fungsionalitas form dari luar widget form itu sendiri (misalnya dari dalam fungsi *callback* `onPressed` milik tombol simpan).
   - **`validator`**: Merupakan properti fungsi pengecekan logika pada setiap `TextFormField`. Fungsi ini mengevaluasi nilai teks masukan dari pengguna; jika input tidak memenuhi kriteria yang ditentukan (misalnya kosong atau hanya berisi spasi), `validator` akan mengembalikan pesan teks kesalahan (*error string*), dan jika input dinyatakan valid, `validator` mengembalikan nilai `null`.
   - **`validate()`**: Dipanggil melalui `_formKey.currentState!.validate()` saat tombol simpan ditekan. Metode ini secara otomatis memicu eksekusi fungsi `validator` pada seluruh `TextFormField` anak yang berada di bawah naungan form secara serempak. Jika seluruh field valid (semuanya mengembalikan `null`), `validate()` mengembalikan nilai `true` sehingga dialog pop-up konfirmasi ditampilkan. Jika ada setidaknya satu field yang tidak valid, `validate()` mengembalikan `false`, membatalkan aksi simpan, dan secara otomatis menampilkan teks peringatan galat berwarna merah tepat di bawah kolom input yang bermasalah.

7. **Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup:**

   - **Contoh nilai yang ditolak**: Memasukkan string kosong (`""`) atau deretan spasi putih saja (`"   "`) pada kolom isian *Judul Pengalaman* atau *Deskripsi Pengalaman*.
   - **Mengapa memilih jenis input atau papan ketik saja belum cukup**:
     - Jenis papan ketik (*keyboard type*, misalnya `TextInputType.text` atau `TextInputType.url`) pada dasarnya hanyalah *petunjuk antarmuka* (*input hint*) untuk mempermudah sistem operasi menampilkan jenis keyboard yang relevan bagi pengguna di layar.
     - Papan ketik bawaan perangkat **tidak memiliki kendali dan tidak dapat mencegah** pengguna menekan tombol spasi berulang kali, mengosongkan kolom isian lalu langsung menekan tombol simpan, atau menempelkan (*paste*) konten yang salah atau kosong dari *clipboard*.
     - Oleh karena itu, antarmuka input selalu membutuhkan lapisan pertahanan berupa **validasi logika bisnis di sisi aplikasi** (`validator` dengan pengecekan `value.trim().isEmpty`) untuk memastikan bahwa data yang dikirim dan disimpan benar-benar valid, tidak kosong, dan memenuhi integritas aturan model yang diharapkan.

---

**Penggunaan AI:**
Dalam pengerjaan Tugas 8 ini, saya memanfaatkan bantuan kecerdasan buatan (Google Gemini) secara transparan sebagai rekan diskusi kritis untuk memahami konsep-konsep lanjutan Flutter. Topik diskusi meliputi pemahaman mendalam mengenai arsitektur tumpukan navigasi (*Navigator stack*) dengan perbedaan `push`, `pushReplacement`, dan `pop`, mekanisme kerja `GlobalKey<FormState>` beserta siklus validasi form, serta strategi perancangan tata letak responsif menggunakan `SingleChildScrollView` untuk mencegah *RenderFlex overflow* saat keyboard virtual aktif. Selain itu, saya berdiskusi mengenai integrasi model `Experience` agar selaras dengan model portofolio Django yang telah saya buat sebelumnya. Seluruh implementasi kode pada `lib/screens/experience_form.dart`, penyesuaian rute pada `left_drawer.dart` dan `project_card.dart`, pengujian bebas galat via `flutter analyze` dan `flutter test`, serta penyusunan jawaban refleksi pada berkas `README.md` ini telah saya pelajari, telaah, dan verifikasi secara mandiri.

* **Tautan Bukti Percakapan AI (Gemini):** [Riwayat Diskusi Konsep Tugas 8 di Google Gemini](https://share.gemini.google/02n4l6gPAexJ)