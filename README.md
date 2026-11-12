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