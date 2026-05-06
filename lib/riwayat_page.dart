import 'package:flutter/material.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy sementara sebelum ada API dari backend
    final List<Map<String, dynamic>> riwayatDummy = [
      {
        "tanggal": "24 April 2026",
        "jam_masuk": "07:45",
        "jam_pulang": "16:10",
        "status": "Tepat Waktu",
      },
      {
        "tanggal": "23 April 2026",
        "jam_masuk": "08:15",
        "jam_pulang": "16:05",
        "status": "Terlambat",
      },
      {
        "tanggal": "22 April 2026",
        "jam_masuk": "07:50",
        "jam_pulang": "16:00",
        "status": "Tepat Waktu",
      },
      {
        "tanggal": "21 April 2026",
        "jam_masuk": "-",
        "jam_pulang": "-",
        "status": "Alpa",
      },
      {
        "tanggal": "20 April 2026",
        "jam_masuk": "07:40",
        "jam_pulang": "16:15",
        "status": "Tepat Waktu",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "Riwayat Kehadiran",
          style: TextStyle(
            color: Color(0xFF2D3E50),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white, // AppBar putih modern
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Color(0xFF2D3E50),
        ), // Warna tombol back
      ),
      body: Column(
        children: [
          // --- HEADER FILTER BULAN ---
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Periode: April 2026",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3E50),
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4364F7).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.filter_list_rounded,
                    color: Color(0xFF4364F7),
                    size: 20,
                  ),
                ),
              ],
            ),
          ),

          // --- LIST RIWAYAT ---
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: riwayatDummy.length,
              itemBuilder: (context, index) {
                final data = riwayatDummy[index];

                // Menentukan warna badge status dengan palet modern
                Color statusColor;
                Color bgColor;
                if (data["status"] == "Tepat Waktu") {
                  statusColor = const Color(0xFF10B981); // Emerald Green
                  bgColor = const Color(0xFF10B981).withOpacity(0.1);
                } else if (data["status"] == "Terlambat") {
                  statusColor = const Color(0xFFF59E0B); // Amber Orange
                  bgColor = const Color(0xFFF59E0B).withOpacity(0.1);
                } else {
                  statusColor = const Color(0xFFEF4444); // Rose Red
                  bgColor = const Color(0xFFEF4444).withOpacity(0.1);
                }

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Baris Atas: Tanggal dan Status
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFF4364F7,
                                  ).withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.calendar_month_rounded,
                                  size: 16,
                                  color: Color(0xFF4364F7),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                data["tanggal"],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF2D3E50),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(
                                30,
                              ), // Border sangat membulat
                            ),
                            child: Text(
                              data["status"],
                              style: TextStyle(
                                color: statusColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),
                      const Divider(
                        height: 1,
                        color: Color(0xFFEEEEEE),
                      ), // Garis pemisah tipis
                      const SizedBox(height: 15),

                      // Baris Bawah: Jam Masuk dan Pulang
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Blok Masuk
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFF10B981,
                                  ).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.login_rounded,
                                  size: 16,
                                  color: Color(0xFF10B981),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Masuk",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    data["jam_masuk"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF2D3E50),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Container(
                            width: 1,
                            height: 35,
                            color: Colors.grey.shade200,
                          ), // Garis vertikal pemisah
                          // Blok Pulang
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFFF59E0B,
                                  ).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.logout_rounded,
                                  size: 16,
                                  color: Color(0xFFF59E0B),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Pulang",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    data["jam_pulang"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF2D3E50),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
