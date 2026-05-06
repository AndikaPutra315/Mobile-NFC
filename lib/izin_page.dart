import 'package:flutter/material.dart';

class IzinPage extends StatefulWidget {
  const IzinPage({super.key});

  @override
  State<IzinPage> createState() => _IzinPageState();
}

class _IzinPageState extends State<IzinPage> {
  // Variabel untuk menyimpan inputan user
  String? _jenisIzin;
  final TextEditingController _tglMulaiCtrl = TextEditingController();
  final TextEditingController _tglSelesaiCtrl = TextEditingController();
  final TextEditingController _alasanCtrl = TextEditingController();

  // Daftar pilihan jenis izin
  final List<String> _pilihanIzin = ['Sakit', 'Cuti Tahunan', 'Izin Khusus'];

  // Fungsi untuk memunculkan kalender bawaan HP
  Future<void> _pilihTanggal(TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF4364F7), // Menggunakan warna biru utama modern
              onPrimary: Colors.white,
              onSurface: Color(0xFF2D3E50),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        controller.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  // Fungsi saat tombol "Ajukan" ditekan
  void _submitForm() {
    if (_jenisIzin == null ||
        _tglMulaiCtrl.text.isEmpty ||
        _tglSelesaiCtrl.text.isEmpty ||
        _alasanCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: const Row(
            children: [
              Icon(Icons.error_outline, color: Colors.white),
              SizedBox(width: 10),
              Text('Harap lengkapi semua data form!'),
            ],
          ),
        ),
      );
      return;
    }

    // Dialog Sukses Modern
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle_rounded, size: 50, color: Color(0xFF10B981)),
              ),
              const SizedBox(height: 20),
              const Text(
                "Pengajuan Terkirim!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF2D3E50)),
              ),
              const SizedBox(height: 10),
              Text(
                "Formulir izin Anda telah masuk ke sistem dan sedang menunggu persetujuan dari atasan/HRD.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600, height: 1.5),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4364F7),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  Navigator.pop(context); // Tutup dialog
                  Navigator.pop(context); // Kembali ke dashboard
                },
                child: const Text("KEMBALI KE BERANDA", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET HELPER UNTUK STYLING INPUT FORM ---
  InputDecoration _buildInputDecoration(String hint, IconData icon) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey.shade100, // Warna background abu-abu terang
      prefixIcon: Icon(icon, color: const Color(0xFF4364F7)),
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none, // Hilangkan border bawaan
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFF4364F7), width: 2), // Border biru saat diklik
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "Pengajuan Izin",
          style: TextStyle(color: Color(0xFF2D3E50), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF2D3E50)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pesan Bantuan Modern
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF4364F7).withOpacity(0.08),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF4364F7).withOpacity(0.3)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline_rounded, color: Color(0xFF4364F7)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Isi form di bawah ini dengan lengkap. Lampirkan surat keterangan dokter jika Anda mengajukan Izin Sakit.",
                      style: TextStyle(fontSize: 12, color: Color(0xFF2D3E50)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Jenis Izin
            const Text("Jenis Izin", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3E50))),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: _buildInputDecoration("Pilih Kategori Izin", Icons.category_rounded),
              icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
              value: _jenisIzin,
              items: _pilihanIzin.map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item, style: const TextStyle(fontWeight: FontWeight.w600)));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() { _jenisIzin = newValue; });
              },
            ),
            const SizedBox(height: 25),

            // Tanggal (Bersebelahan)
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Tanggal Mulai", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3E50))),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _tglMulaiCtrl,
                        readOnly: true,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        onTap: () => _pilihTanggal(_tglMulaiCtrl),
                        decoration: _buildInputDecoration("DD/MM/YYYY", Icons.date_range_rounded),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Tanggal Selesai", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3E50))),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _tglSelesaiCtrl,
                        readOnly: true,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        onTap: () => _pilihTanggal(_tglSelesaiCtrl),
                        decoration: _buildInputDecoration("DD/MM/YYYY", Icons.date_range_rounded),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // Alasan
            const Text("Alasan / Keterangan", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3E50))),
            const SizedBox(height: 10),
            TextFormField(
              controller: _alasanCtrl,
              maxLines: 4,
              style: const TextStyle(fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade100,
                hintText: "Tuliskan alasan pengajuan Anda secara jelas...",
                hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                contentPadding: const EdgeInsets.all(20),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: Color(0xFF4364F7), width: 2)),
              ),
            ),
            const SizedBox(height: 25),

            // Upload Dokumen
            const Text("Lampiran Pendukung (Opsional)", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3E50))),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Fitur kamera/galeri akan segera aktif!')),
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid, width: 1.5),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: const Color(0xFF4364F7).withOpacity(0.1), shape: BoxShape.circle),
                      child: const Icon(Icons.cloud_upload_rounded, color: Color(0xFF4364F7), size: 28),
                    ),
                    const SizedBox(height: 12),
                    const Text("Ketuk untuk mengunggah Foto/PDF", style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF2D3E50))),
                    const SizedBox(height: 5),
                    Text("Maksimal ukuran file: 2MB", style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Tombol Submit Utama
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4364F7),
                foregroundColor: Colors.white,
                elevation: 5,
                shadowColor: const Color(0xFF4364F7).withOpacity(0.5),
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text("KIRIM PENGAJUAN", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1)),
            ),
            const SizedBox(height: 20), // Memberi sedikit jarak bawah
          ],
        ),
      ),
    );
  }
}