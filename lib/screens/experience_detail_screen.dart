import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/experience.dart';

// layar untuk menampilkan detail lengkap riwayat pengalaman
class ExperienceDetailScreen extends StatelessWidget {
  const ExperienceDetailScreen({required this.experience, super.key});

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    // tentukan label kategori yang ramah pengguna
    final categoryText = experience.categoryDisplay.isNotEmpty
        ? experience.categoryDisplay
        : experience.category;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          experience.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // tampilkan gambar thumbnail jika tautan tidak kosong
            if (experience.thumbnail.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  experience.thumbnail,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],

            // judul pengalaman
            Text(
              experience.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // baris label kategori dan status
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(
                  avatar: const Icon(Icons.work_outline, size: 18),
                  label: Text(categoryText),
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .primaryContainer,
                ),
                Chip(
                  avatar: Icon(
                    experience.isOngoing ? Icons.timelapse : Icons.check_circle,
                    size: 18,
                    color: experience.isOngoing
                        ? Colors.amber.shade900
                        : Colors.green.shade700,
                  ),
                  label: Text(
                    experience.isOngoing ? 'Masih Berlangsung' : 'Selesai',
                  ),
                  backgroundColor: experience.isOngoing
                      ? Colors.amber.shade100
                      : Colors.green.shade100,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // bagian deskripsi pengalaman
            const Text(
              'Deskripsi Pengalaman:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              experience.description,
              style: const TextStyle(fontSize: 15, height: 1.5),
            ),
            const SizedBox(height: 20),

            // informasi tanggal selesai jika ada
            if (experience.endedAt != null &&
                experience.endedAt!.isNotEmpty) ...[
              const Text(
                'Waktu Selesai:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                experience.endedAt!,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
