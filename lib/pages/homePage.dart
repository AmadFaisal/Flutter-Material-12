import 'package:flutter/material.dart';
import 'package:rpl2/routes/app_routes.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 122, 225, 225),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.dashboard_customize_rounded,
                size: 64,
                color: Color.fromARGB(255, 70, 160, 160),
              ),
              const SizedBox(height: 12),
              const Text(
                'Halaman Home',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Pilih menu navigasi di bawah ini',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 28),

              // Tombol ke Halaman About
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.info_outline),
                  label: const Text('Ke Halaman About'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.about);
                  },
                ),
              ),
              const SizedBox(height: 12),

              // Tombol ke Halaman ListView
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.list_alt),
                  label: const Text('Ke Halaman ListView'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.list_basic);
                  },
                ),
              ),
              const SizedBox(height: 12),

              // Tombol ke Halaman GridView
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.grid_view),
                  label: const Text('Ke Halaman GridView'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.gridBasic);
                  },
                ),
              ),
              const SizedBox(height: 12),

              // Tombol ke Halaman GridView (Builder)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.grid_on),
                  label: const Text('Ke Halaman GridView (Builder)'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.gridBuilder);
                  },
                ),
              ),
              const SizedBox(height: 12),

              // Tombol ke Halaman Form
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.assignment_outlined),
                  label: const Text('Ke Halaman Form'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 78, 47, 216),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.form);
                  },
                ),
              ),

              const SizedBox(height: 12),
              // Tombol ke Halaman Status
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.query_stats_rounded),
                  label: const Text('Ke Halaman Instagram'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 78, 47, 216),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.instagram);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
