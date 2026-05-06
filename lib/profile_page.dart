import 'package:flutter/material.dart';
import 'login.dart'; // Wajib di-import agar fungsi Keluar bisa berjalan

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- HEADER MODERN DENGAN AVATAR MELAYANG ---
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Background Gradient Lengkung
                Container(
                  height: 240,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF0052D4), Color(0xFF4364F7)],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: const SafeArea(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          "Profil Pegawai",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Avatar Melayang
                Positioned(
                  bottom: -50,
                  child: Container(
                    padding: const EdgeInsets.all(5), // Jarak putih (border)
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundColor: Color(0xFFF8F9FA),
                      child: Icon(
                        Icons.person_rounded,
                        size: 60,
                        color: Color(0xFF4364F7),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 65), // Jarak kompensasi avatar melayang
            // --- NAMA & NIP ---
            const Text(
              "Aji Dwi Andika Putra",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Color(0xFF2D3E50),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF4364F7).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "NIP: 19990412 202601 1 001",
                style: TextStyle(
                  color: Color(0xFF4364F7),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // --- KARTU INFORMASI PROFIL ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildProfileItem(
                      Icons.email_outlined,
                      "Email",
                      "aji.andika@amk.co.id",
                    ),
                    const Divider(height: 1, indent: 60, endIndent: 20),
                    _buildProfileItem(
                      Icons.work_outline_rounded,
                      "Jabatan",
                      "IT Development",
                    ),
                    const Divider(height: 1, indent: 60, endIndent: 20),
                    _buildProfileItem(
                      Icons.business_rounded,
                      "Unit Kerja",
                      "PT. Anugerah Mitra Kalimantan",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // --- TOMBOL KELUAR ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Logika Keluar (Menghapus riwayat halaman agar tidak bisa di-back)
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (Route<dynamic> route) => false,
                  );
                },
                icon: const Icon(Icons.logout_rounded),
                label: const Text(
                  "Keluar Aplikasi",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFF0F0), // Merah sangat muda
                  foregroundColor: const Color(0xFFE53935), // Teks merah
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Widget Item List yang lebih rapi dan bersih
  Widget _buildProfileItem(IconData icon, String title, String value) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF4364F7).withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: const Color(0xFF4364F7), size: 22),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2D3E50),
        ),
      ),
    );
  }
}
