import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import package url_launcher

class BantuanPage extends StatelessWidget {
  const BantuanPage({super.key});

  // Fungsi untuk membuka WhatsApp
  Future<void> _launchWhatsApp() async {
    // Format nomor WA: ganti angka 0 di depan dengan 62
    final Uri whatsappUrl = Uri.parse(
      'https://wa.me/6281234567890',
    ); // Ganti dengan nomor WhatsApp yang valid

    if (!await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication)) {
      debugPrint('Tidak dapat membuka WhatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "Pusat Bantuan",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFF2D3E50),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- BAGIAN HEADER KONTAK WA (DIPERBARUI DENGAN STYLING & KLIK) ---
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _launchWhatsApp, // Panggil fungsi WA saat diklik
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.green.shade400,
                      width: 1.5,
                    ), // Border hijau khas WA
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Ikon Support dengan background hijau
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.support_agent_rounded,
                          size: 35,
                          color: Colors.green.shade700,
                        ),
                      ),
                      const SizedBox(width: 15),
                      // Teks Informasi
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Butuh Bantuan Langsung?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xFF2D3E50),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Klik untuk chat via WhatsApp",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "0831-5093-4114",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Ikon panah sebagai indikator bisa diklik
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.green.shade400,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),

            // --- BAGIAN FAQ (FAQ STYLING DIPERHALUS) ---
            const Text(
              "Pertanyaan Umum (FAQ)",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF2D3E50),
              ),
            ),
            const SizedBox(height: 15),

            Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: const ExpansionTile(
                iconColor: Color(0xFF2D3E50),
                collapsedIconColor: Colors.grey,
                title: Text(
                  "Bagaimana cara absen jika kartu NFC tertinggal?",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: Text(
                      "Jika kartu NFC Anda tertinggal, harap segera melapor ke Admin Kepegawaian agar dibukakan akses presensi manual melalui sistem pusat.",
                      style: TextStyle(color: Colors.black87, height: 1.4),
                    ),
                  ),
                ],
              ),
            ),

            Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: const ExpansionTile(
                iconColor: Color(0xFF2D3E50),
                collapsedIconColor: Colors.grey,
                title: Text(
                  "Kapan batas waktu absen masuk (Tepat Waktu)?",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: Text(
                      "Batas waktu absen masuk adalah pukul 08:00 WITA. Jika Anda tap kartu di atas jam tersebut, status akan otomatis tercatat sebagai Terlambat.",
                      style: TextStyle(color: Colors.black87, height: 1.4),
                    ),
                  ),
                ],
              ),
            ),

            Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: const ExpansionTile(
                iconColor: Color(0xFF2D3E50),
                collapsedIconColor: Colors.grey,
                title: Text(
                  "Berapa lama proses persetujuan Izin/Cuti?",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: Text(
                      "Proses persetujuan (approval) izin atau cuti biasanya memakan waktu maksimal 1x24 jam kerja. Anda bisa mengecek statusnya secara berkala di halaman ini.",
                      style: TextStyle(color: Colors.black87, height: 1.4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
