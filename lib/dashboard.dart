import 'package:flutter/material.dart';
import 'dart:async'; // Ditambahkan untuk menggunakan fitur Timer Real-time
import 'nfc_page.dart';
import 'profile_page.dart';
import 'riwayat_page.dart';
import 'izin_page.dart';
import 'bantuan_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardContent(),
    const NfcPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF4364F7),
          unselectedItemColor: Colors.grey.shade400,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.dashboard_rounded),
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.nfc_rounded),
              ),
              label: 'Presensi',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.person_rounded),
              ),
              label: 'Akun',
            ),
          ],
        ),
      ),
    );
  }
}

// Mengubah DashboardContent menjadi StatefulWidget agar bisa mengelola waktu berjalan
class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  late DateTime currentTime;
  Timer? timer;

  // Array untuk translate bahasa Indonesia manual (tanpa library tambahan)
  final List<String> namaHari = [
    'Minggu',
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
  ];
  final List<String> namaBulan = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  @override
  void initState() {
    super.initState();
    currentTime = DateTime.now(); // Ambil waktu saat ini pertama kali

    // Timer yang akan update state setiap 1 menit
    // Agar ketika ganti hari di tengah malam, UI langsung merespons
    timer = Timer.periodic(const Duration(minutes: 1), (Timer t) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer
        ?.cancel(); // Hentikan timer jika halaman ditutup agar tidak bocor memori
    super.dispose();
  }

  // Fungsi helper untuk mendapatkan format tanggal Indonesia
  String getTanggalLengkap() {
    String hari = namaHari[currentTime.weekday == 7 ? 0 : currentTime.weekday];
    String bulan = namaBulan[currentTime.month - 1];
    return "$hari, ${currentTime.day} $bulan ${currentTime.year}";
  }

  String getBulanTahun() {
    return "${namaBulan[currentTime.month - 1]} ${currentTime.year}";
  }

  @override
  Widget build(BuildContext context) {
    // Menghitung otomatis jumlah hari dalam bulan ini
    int jumlahHariDiBulanIni = DateUtils.getDaysInMonth(
      currentTime.year,
      currentTime.month,
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          // --- HEADER MELENGKUNG ---
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 60,
                  left: 24,
                  right: 24,
                  bottom: 70,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF0052D4), Color(0xFF4364F7)],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Halo, Aji Andika!",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Menampilkan Tanggal Real-time di Header
                        Text(
                          getTanggalLengkap(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.person, color: Colors.white, size: 30),
                    ),
                  ],
                ),
              ),

              // --- FLOATING CARD (Status Absen Hari Ini) ---
              Positioned(
                bottom: -40,
                left: 24,
                right: 24,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatusAbsen(
                        Icons.login_rounded,
                        "Masuk",
                        "07:45",
                        Colors.green,
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey.shade200,
                      ),
                      _buildStatusAbsen(
                        Icons.logout_rounded,
                        "Pulang",
                        "--:--",
                        Colors.orange,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 60),

          // --- MENU GRID MODERN ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMenuItem(context, Icons.history_rounded, "Riwayat"),
                _buildMenuItem(context, Icons.edit_document, "Izin/Cuti"),
                _buildMenuItem(context, Icons.support_agent_rounded, "Bantuan"),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // --- AREA KALENDER MODERN (REAL-TIME) ---
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(20),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Menampilkan Bulan dan Tahun Real-time
                    Text(
                      getBulanTahun(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF2D3E50),
                      ),
                    ),
                    Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // Header Hari
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: ["S", "S", "R", "K", "J", "S", "M"].map((day) {
                    return Text(
                      day,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                // Grid Tanggal yang menyesuaikan jumlah hari dalam bulan
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 10,
                  ),
                  itemCount:
                      jumlahHariDiBulanIni, // Dinamis sesuai kalender asli
                  itemBuilder: (context, index) {
                    // Cek apakah kotak ini adalah tanggal hari ini secara real-time
                    bool isToday = (index + 1 == currentTime.day);

                    return Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: isToday
                            ? const Color(0xFF4364F7)
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                            color: isToday
                                ? Colors.white
                                : const Color(0xFF2D3E50),
                            fontWeight: isToday
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // Widget bantuan untuk status Masuk/Pulang
  Widget _buildStatusAbsen(
    IconData icon,
    String title,
    String time,
    Color color,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 5),
            Text(
              title,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          time,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3E50),
          ),
        ),
      ],
    );
  }

  // Widget menu grid
  Widget _buildMenuItem(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        if (label == "Riwayat") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RiwayatPage()),
          );
        } else if (label == "Izin/Cuti") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const IzinPage()),
          );
        } else if (label == "Bantuan") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BantuanPage()),
          );
        }
      },
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF4364F7).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: const Color(0xFF4364F7), size: 26),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D3E50),
            ),
          ),
        ],
      ),
    );
  }
}
