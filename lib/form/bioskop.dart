import 'package:flutter/material.dart';

void main() {
  runApp( Cinema());
}

class Cinema extends StatelessWidget {
  const Cinema({super.key});

  @override
  Widget build(BuildContext me) {
    return MaterialApp(
      title: 'CineStar Booking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFE50914), // Red Accent
          secondary: Color(0xFFFFB400), // Gold Accent
          surface: Color(0xFF1E1E1E),
        ),
      ),
      home: const MovieListPage(),
    );
  }
}

// ==========================================
// DATA DUMMY (MENGGUNAKAN LIST & MAP SAJA)
// ==========================================
final List<Map<String, dynamic>> movieList = [
  {
    'id': 'm1',
    'title': 'Dune: Part Two',
    'genre': 'Sci-Fi / Action',
    'rating': '8.6',
    'price': 50000,
    'duration': '2j 46m',
    'image': 'https://images.unsplash.com/photo-1534447677768-be436bb09401?w=500&q=80',
    'banner': 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=800&q=80',
    'synopsis': 'Paul Atreides bersatu dengan Chani dan suku Fremen untuk membalas dendam terhadap para konspirator.',
  },
  {
    'id': 'm2',
    'title': 'Cyberpunk Odyssey',
    'genre': 'Cyberpunk / Thriller',
    'rating': '9.0',
    'price': 55000,
    'duration': '2j 15m',
    'image': 'https://images.unsplash.com/photo-1607604276583-eef5d076aa5f?w=500&q=80',
    'banner': 'https://images.unsplash.com/photo-1578632767115-351597cf2477?w=800&q=80',
    'synopsis': 'Di kota masa depan yang dipenuhi neon, seorang hacker mencoba membongkar konspirasi terbesar korporasi maya.',
  },
  {
    'id': 'm3',
    'title': 'Neon Horizon',
    'genre': 'Action / Sci-Fi',
    'rating': '8.2',
    'price': 45000,
    'duration': '1j 58m',
    'image': 'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=500&q=80',
    'banner': 'https://images.unsplash.com/photo-1511871893393-82e9c16b81e3?w=800&q=80',
    'synopsis': 'Perjalanan penjelajah ruang angkasa yang terdampar di planet misterius tanpa komunikasi ke bumi.',
  },
  {
    'id': 'm4',
    'title': 'The Dark Knight Protocol',
    'genre': 'Action / Crime',
    'rating': '9.1',
    'price': 60000,
    'duration': '2j 30m',
    'image': 'https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?w=500&q=80',
    'banner': 'https://images.unsplash.com/photo-1478760329108-5c3ed9d495a0?w=800&q=80',
    'synopsis': 'Detektif bayangan melawan jaringan kejahatan yang terorganisir di kota metropolis yang kelam.',
  },
];

final List<Map<String, dynamic>> snackList = [
  {
    'id': 's1',
    'name': 'Caramel Popcorn Jumbo',
    'category': 'Snack',
    'price': 40000,
    'icon': Icons.fastfood,
  },
  {
    'id': 's2',
    'name': 'Coca Cola XL (1 Litre)',
    'category': 'Drink',
    'price': 25000,
    'icon': Icons.local_drink,
  },
  {
    'id': 's3',
    'name': 'Combo Hemat (Popcorn + Drink)',
    'category': 'Combo',
    'price': 55000,
    'icon': Icons.fastfood,
  },
  {
    'id': 's4',
    'name': 'Crispy Nachos Cheese',
    'category': 'Snack',
    'price': 35000,
    'icon': Icons.lunch_dining,
  },
];

// Baris & Kolom Duduk Bioskop Dummy
final List<String> seatRows = ['A', 'B', 'C', 'D'];
final int seatCols = 6;
// Daftar kursi yang sudah terisi orang lain (Booked/Occupied)
final List<String> reservedSeats = ['A2', 'B4', 'C1', 'C2', 'D5'];

// ==========================================
// PAGE 1: DAFTAR ITEM (KATALOG FILM & PROMO)
// ==========================================
class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  int _selectedCategoryIndex = 0;
  final List<String> categories = ['Now Showing', 'Upcoming', 'IMAX 3D', 'VIP Cinema'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header User Profile
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&q=80',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Selamat Datang,',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            'Alex James',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF252525),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Hero Banner / Promo Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE50914), Color(0xFF800020)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFE50914).withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'PROMO SPESIAL',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFB400),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Diskon 20% Tiket Premiere!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Berlaku untuk pembayaran QRIS',
                            style: TextStyle(fontSize: 12, color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.confirmation_number_outlined, size: 50, color: Colors.white38),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Categories Chips
              SizedBox(
                height: 38,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    bool isSelected = _selectedCategoryIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFFFB400) : const Color(0xFF252525),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.white70,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                'Sedang Tayang Hari Ini',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 14),

              // Grid Item List (Movies)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: movieList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemBuilder: (context, index) {
                  final movie = movieList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingDetailPage(movieData: movie),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                                  child: Image.network(
                                    movie['image'],
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.star, color: Color(0xFFFFB400), size: 12),
                                        const SizedBox(width: 4),
                                        Text(
                                          movie['rating'],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie['title'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  movie['genre'],
                                  maxLines: 1,
                                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Rp ${movie['price']}',
                                      style: const TextStyle(
                                        color: Color(0xFFFFB400),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE50914),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(Icons.arrow_forward_ios, size: 10, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ====================================================================================
// PAGE 2: DETAIL ITEMS (SEAT SELECTION + MULTI ITEM: TIKET & SNACK) & PAYMENT
// ====================================================================================
class BookingDetailPage extends StatefulWidget {
  final Map<String, dynamic> movieData;

  const BookingDetailPage({Key? key, required this.movieData}) : super(key: key);

  @override
  State<BookingDetailPage> createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends State<BookingDetailPage> {
  List<String> selectedSeats = ['B2']; // Default pilih 1 kursi
  Map<String, int> snackQuantities = {};
  String selectedPaymentMethod = 'QRIS'; // Options: 'QRIS', 'CASH'
  final TextEditingController cashInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (var snack in snackList) {
      snackQuantities[snack['id']] = 0;
    }
  }

  int get ticketQty => selectedSeats.length;

  int get ticketTotalPrice => widget.movieData['price'] * ticketQty;

  int get snackTotalPrice {
    int total = 0;
    snackList.forEach((snack) {
      int qty = snackQuantities[snack['id']] ?? 0;
      total += (snack['price'] as int) * qty;
    });
    return total;
  }

  int get grandTotal => ticketTotalPrice + snackTotalPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Kursi & Detail Bayar', style: TextStyle(fontSize: 16)),
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Ringkas Film
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.movieData['image'],
                    width: 70,
                    height: 95,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.movieData['title'],
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text(widget.movieData['genre'], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      const SizedBox(height: 4),
                      Text('Durasi: ${widget.movieData['duration']}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      const SizedBox(height: 6),
                      Text(
                        'Rp ${widget.movieData['price']} / seat',
                        style: const TextStyle(color: Color(0xFFFFB400), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            const Divider(color: Colors.white24),
            const SizedBox(height: 10),

            // ==========================================
            // SEAT SELECTION LAYOUT (DENAH KORSI XXI)
            // ==========================================
            const Text('Pilih Tempat Duduk Bioskop', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 12),

            // Visual Layar Bioskop
            Center(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE50914),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE50914).withOpacity(0.6),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('LAYAR BIOSKOP', style: TextStyle(color: Colors.grey, fontSize: 10, letterSpacing: 2)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Grid Tempat Duduk (Seat Grid)
            Column(
              children: seatRows.map((rowLabel) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(seatCols, (index) {
                      String seatId = '$rowLabel${index + 1}';
                      bool isReserved = reservedSeats.contains(seatId);
                      bool isSelected = selectedSeats.contains(seatId);

                      Color seatColor;
                      if (isReserved) {
                        seatColor = const Color(0xFF333333); // Gray/Unavailable
                      } else if (isSelected) {
                        seatColor = const Color(0xFFE50914); // Selected Red
                      } else {
                        seatColor = const Color(0xFF252525); // Available Dark
                      }

                      return GestureDetector(
                        onTap: isReserved
                            ? null
                            : () {
                                setState(() {
                                  if (isSelected) {
                                    selectedSeats.remove(seatId);
                                  } else {
                                    selectedSeats.add(seatId);
                                  }
                                });
                              },
                        child: Container(
                          width: 38,
                          height: 38,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: seatColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected ? const Color(0xFFFFB400) : Colors.white10,
                              width: isSelected ? 1.5 : 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              seatId,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: isReserved
                                    ? Colors.white24
                                    : (isSelected ? Colors.white : Colors.white70),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 14),

            // Seat Status Legend
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(const Color(0xFF252525), 'Tersedia'),
                const SizedBox(width: 16),
                _buildLegendItem(const Color(0xFFE50914), 'Terpilih'),
                const SizedBox(width: 16),
                _buildLegendItem(const Color(0xFF333333), 'Terisi'),
              ],
            ),

            const SizedBox(height: 16),

            // Ringkasan Kursi Terpilih & Jumlah Tiket
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Kursi Terpilih:', style: TextStyle(color: Colors.grey, fontSize: 13)),
                  Text(
                    selectedSeats.isEmpty ? 'Belum Ada' : selectedSeats.join(', '),
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFB400), fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Divider(color: Colors.white24),
            const SizedBox(height: 10),

            // MULTI ITEM: Snack & Beverage Selection
            const Text('Tambah Snack & Minuman (Opsional)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 10),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snackList.length,
              itemBuilder: (context, index) {
                final snack = snackList[index];
                final String snackId = snack['id'];
                final int currentQty = snackQuantities[snackId] ?? 0;

                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(snack['icon'] as IconData, color: const Color(0xFFFFB400), size: 26),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snack['name'], style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                            Text('Rp ${snack['price']}', style: const TextStyle(color: Colors.grey, fontSize: 11)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (currentQty > 0) {
                                setState(() {
                                  snackQuantities[snackId] = currentQty - 1;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
                              child: const Icon(Icons.remove, size: 16, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('$currentQty', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                snackQuantities[snackId] = currentQty + 1;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(color: Color(0xFFE50914), shape: BoxShape.circle),
                              child: const Icon(Icons.add, size: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
            const Divider(color: Colors.white24),
            const SizedBox(height: 10),

            // Metode Pembayaran (CASH & QRIS)
            const Text('Metode Pembayaran', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedPaymentMethod = 'QRIS'),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: selectedPaymentMethod == 'QRIS' ? const Color(0xFFE50914).withOpacity(0.2) : const Color(0xFF1E1E1E),
                        border: Border.all(
                          color: selectedPaymentMethod == 'QRIS' ? const Color(0xFFE50914) : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: const [
                          Icon(Icons.qr_code_scanner, color: Colors.white),
                          SizedBox(height: 6),
                          Text('QRIS Instant', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedPaymentMethod = 'CASH'),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: selectedPaymentMethod == 'CASH' ? const Color(0xFFE50914).withOpacity(0.2) : const Color(0xFF1E1E1E),
                        border: Border.all(
                          color: selectedPaymentMethod == 'CASH' ? const Color(0xFFE50914) : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: const [
                          Icon(Icons.payments, color: Colors.white),
                          SizedBox(height: 6),
                          Text('Cash / Tunai', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Form Input Jika Pilih Cash
            if (selectedPaymentMethod == 'CASH') ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Nominal Uang Tunai (Rp):', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(height: 6),
                    TextField(
                      controller: cashInputController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Masukkan nominal uang (contoh: 100000)',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                      onChanged: (val) => setState(() {}),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 24),

            // Ringkasan Total Biaya
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF252525),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tiket ($ticketQty x):', style: const TextStyle(color: Colors.grey)),
                      Text('Rp $ticketTotalPrice', style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Snack:', style: TextStyle(color: Colors.grey)),
                      Text('Rp $snackTotalPrice', style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  const Divider(color: Colors.white24, height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Grand Total:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(
                        'Rp $grandTotal',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFFFFB400)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Tombol Konfirmasi Bayar
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE50914),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  if (selectedSeats.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Silakan pilih minimal 1 tempat duduk!'),
                        backgroundColor: Colors.orangeAccent,
                      ),
                    );
                    return;
                  }

                  int cashPaid = int.tryParse(cashInputController.text) ?? 0;

                  // Validasi jika bayar Cash tapi uang kurang
                  if (selectedPaymentMethod == 'CASH' && cashPaid < grandTotal) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Uang tunai tidak mencukupi total pembayaran!'),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                    return;
                  }

                  // Rekap snack terpilih
                  List<Map<String, dynamic>> orderedSnacks = [];
                  snackList.forEach((snack) {
                    int q = snackQuantities[snack['id']] ?? 0;
                    if (q > 0) {
                      orderedSnacks.add({
                        'name': snack['name'],
                        'qty': q,
                        'price': snack['price'],
                        'total': snack['price'] * q,
                      });
                    }
                  });

                  Map<String, dynamic> transactionData = {
                    'movieTitle': widget.movieData['title'],
                    'seats': selectedSeats.join(', '),
                    'ticketQty': ticketQty,
                    'ticketPrice': widget.movieData['price'],
                    'ticketTotal': ticketTotalPrice,
                    'snacks': orderedSnacks,
                    'grandTotal': grandTotal,
                    'paymentMethod': selectedPaymentMethod,
                    'cashPaid': cashPaid,
                    'change': selectedPaymentMethod == 'CASH' ? (cashPaid - grandTotal) : 0,
                    'bookingId': 'CS-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
                    'date': '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}',
                  };

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReceiptPage(transactionData: transactionData),
                    ),
                  );
                },
                child: const Text(
                  'Konfirmasi & Bayar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }
}

// ==========================================
// PAGE 3: STRUK PEMBAYARAN (RECEIPT / TIKET)
// ==========================================
class ReceiptPage extends StatelessWidget {
  final Map<String, dynamic> transactionData;

  const ReceiptPage({Key? key, required this.transactionData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List orderedSnacks = transactionData['snacks'] as List;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bukti Pembayaran / E-Ticket'),
        backgroundColor: const Color(0xFF1E1E1E),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Container Struk Tiket XXI
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF252525),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        const Icon(Icons.check_circle_outline, color: Colors.greenAccent, size: 55),
                        const SizedBox(height: 8),
                        const Text(
                          'PEMBAYARAN BERHASIL',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.greenAccent),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          transactionData['date'],
                          style: const TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: Colors.white24, thickness: 1),
                  const SizedBox(height: 10),

                  // Detail Informasi Transaksi
                  _buildDetailRow('Kode Booking', transactionData['bookingId'], isBold: true),
                  _buildDetailRow('Metode Bayar', transactionData['paymentMethod']),
                  _buildDetailRow('Nomor Kursi', transactionData['seats'], textColor: const Color(0xFFFFB400), isBold: true),
                  const SizedBox(height: 12),

                  const Text('Rincian Tiket Film:', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 4),
                  _buildDetailRow(
                    '${transactionData['movieTitle']} (${transactionData['ticketQty']}x)',
                    'Rp ${transactionData['ticketTotal']}',
                  ),

                  if (orderedSnacks.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    const Text('Rincian Snack & Minuman:', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(height: 4),
                    ...orderedSnacks.map((snack) {
                      return _buildDetailRow(
                        '${snack['name']} (${snack['qty']}x)',
                        'Rp ${snack['total']}',
                      );
                    }).toList(),
                  ],

                  const SizedBox(height: 12),
                  const Divider(color: Colors.white24, thickness: 1),
                  const SizedBox(height: 8),

                  _buildDetailRow(
                    'TOTAL BIAYA',
                    'Rp ${transactionData['grandTotal']}',
                    isBold: true,
                    textColor: const Color(0xFFFFB400),
                  ),

                  if (transactionData['paymentMethod'] == 'CASH') ...[
                    _buildDetailRow('Uang Dibayar', 'Rp ${transactionData['cashPaid']}'),
                    _buildDetailRow('Kembalian', 'Rp ${transactionData['change']}', textColor: Colors.greenAccent),
                  ],

                  const SizedBox(height: 24),
                  // Barcode / QR Code visual untuk pintu masuk XXI
                  Center(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.qr_code_2,
                            size: 110,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Scan QR ini di pintu masuk studio XXI',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Action Buttons
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE50914),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                icon: const Icon(Icons.home, color: Colors.white),
                label: const Text('Kembali ke Beranda', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false, Color textColor = Colors.white}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: isBold ? Colors.white : Colors.white70,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              color: textColor,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}