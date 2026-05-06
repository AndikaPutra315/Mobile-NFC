import 'package:flutter/material.dart';

class BantuanPage extends StatelessWidget {
  const BantuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("Pusat Bantuan", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF2D3E50),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian Header Kontak Admin
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFF2D3E50), width: 1),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
                ],
              ),
              child: const Row(
                children: [
                  Icon(Icons.support_agent_rounded, size: 50, color: Color(0xFF2D3E50)),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Butuh Bantuan Langsung?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 5),
                        Text("Hubungi Admin Kepegawaian (Bapak Budi) via WhatsApp: 0812-3456-7890", style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Bagian Pertanyaan yang Sering Diajukan (FAQ)
            const Text("Pertanyaan Umum (FAQ)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF2D3E50))),
            const SizedBox(height: 10),

            // Item FAQ 1
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: const ExpansionTile(
                title: Text("Bagaimana cara absen jika kartu NFC tertinggal?"),
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Jika kartu NFC Anda tertinggal, harap segera melapor ke Admin Kepegawaian agar dibukakan akses presensi manual melalui sistem pusat."),
                  )
                ],
              ),
            ),

            // Item FAQ 2
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: const ExpansionTile(
                title: Text("Kapan batas waktu absen masuk (Tepat Waktu)?"),
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Batas waktu absen masuk adalah pukul 08:00 WITA. Jika Anda tap kartu di atas jam tersebut, status akan otomatis tercatat sebagai Terlambat."),
                  )
                ],
              ),
            ),

            // Item FAQ 3
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: const ExpansionTile(
                title: Text("Berapa lama proses persetujuan Izin/Cuti?"),
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Proses persetujuan (approval) izin atau cuti biasanya memakan waktu maksimal 1x24 jam kerja. Anda bisa mengecek statusnya secara berkala di halaman ini."),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}