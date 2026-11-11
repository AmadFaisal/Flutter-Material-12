import 'package:flutter/material.dart';
import 'package:rpl2/form/Bioskop/BookingDetail_page.dart';

class CinemaApp extends StatelessWidget {
  const CinemaApp({super.key});

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
    'title': 'Interstellar: Beyond the Stars',
    'genre': 'Sci-Fi - Action',
    'rating': '8.6',
    'price': 50000,
    'duration': '2j 49m',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdtyBwYGFLJBoKQ8EbDpWeR9nQsasDv6MEWa6UGZEDJA&s=10',
    'banner': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdtyBwYGFLJBoKQ8EbDpWeR9nQsasDv6MEWa6UGZEDJA&s=10',
    'synopsis': 'Paul Atreides bersatu dengan Chani dan suku Fremen untuk membalas dendam terhadap para konspirator.',
  },
  {
    'id': 'm2',
    'title': 'Forrest Gump: The Sequel',
    'genre': 'Comedy - Drama - Romance',
    'rating': '8.4',
    'price': 55000,
    'duration': '2j 22m',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT20e7e6XB12gLax5Hx8ZNL97MTSR2cZbS8GIeeiwBz_g&s=10',
    'banner': 'https://images.unsplash.com/photo-1578632767115-351597cf2477?w=800&q=80',
    'synopsis': 'Di kota masa depan yang dipenuhi neon, seorang hacker mencoba membongkar konspirasi terbesar korporasi maya.',
  },
  {
    'id': 'm3',
    'title': 'Better Call Saul: The Movie',
    'genre': 'Action - Sci-Fi',
    'rating': '9.0',
    'price': 45000,
    'duration': '1j 58m',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnKFhI4VyoYd0ztUPBxoB6-YeIVDhGbgPl-I4gJVFCLA&s=10',
    'banner': 'https://images.unsplash.com/photo-1511871893393-82e9c16b81e3?w=800&q=80',
    'synopsis': 'Perjalanan penjelajah ruang angkasa yang terdampar di planet misterius tanpa komunikasi ke bumi.',
  },
  {
    'id': 'm4',
    'title': 'Breaking Bad',
    'genre': 'Action - Crime',
    'rating': '8.9',
    'price': 60000,
    'duration': '2j 30m',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRU4Lt1GS8N1C3ygqNr4cqwNJJhdzekNC2LE5Aip8o8Q&s=10',
    'banner': 'https://images.unsplash.com/photo-1478760329108-5c3ed9d495a0?w=800&q=80',
    'synopsis': 'Detektif bayangan melawan jaringan kejahatan yang terorganisir di kota metropolis yang kelam.',
  },
  {
    'id': 'm5',
    'title': 'Spider-Man: Across The Spider-Verse',
    'genre': 'Action - Adventure',
    'rating': '9.0',
    'price': 56000,
    'duration': '2j 30m',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd8xZ6cpNEli_U9Z421Nz9ux-rgtvt0TGBa1UYDk5ZEw&s=10',
    'banner': 'https://images.unsplash.com/photo-1478760329108-5c3ed9d495a0?w=800&q=80',
    'synopsis': 'Detektif bayangan melawan jaringan kejahatan yang terorganisir di kota metropolis yang kelam.',
  },
  {
    'id': 'm6',
    'title': 'Transformers: ONE',
    'genre': 'Sci-Fi - Action-Adventure',
    'rating': '9.1',
    'price': 45000,
    'duration': '2j 30m',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTX2RgvTGKaMp3oB0aUkQwIp2APJ4r5kB6x6ku1TdD4Mg&s=10',
    'banner': 'https://images.unsplash.com/photo-1478760329108-5c3ed9d495a0?w=800&q=80',
    'synopsis': 'Detektif bayangan melawan jaringan kejahatan yang terorganisir di kota metropolis yang kelam.',
  },
  {
    'id': 'm7',
    'title': 'Shin Godzilla: The Awakening',
    'genre': 'Kaiju - Sci-Fi - Political - Thriller and Horror',
    'rating': '7.6',
    'price': 51000,
    'duration': '2j 30m',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYQ8FIEoXjsJzL4U0YuDlgEuVLeQ8IZ4dLfxppPCOOKg&s=10',
    'banner': 'https://images.unsplash.com/photo-1478760329108-5c3ed9d495a0?w=800&q=80',
    'synopsis': 'Detektif bayangan melawan jaringan kejahatan yang terorganisir di kota metropolis yang kelam.',
  },
  {
    'id': 'm8',
    'title': 'Weathering With You: The Storm',
    'genre': 'Romance - Drama - Fantasy',
    'rating': '8.9',
    'price': 63000,
    'duration': '2j 30m',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw4RBaL8PDvRhaVajALRy2XuGkdGbj7hh1LkXKJY2Qfg&s=10',
    'banner': 'https://images.unsplash.com/photo-1478760329108-5c3ed9d495a0?w=800&q=80',
    'synopsis': 'Detektif bayangan melawan jaringan kejahatan yang terorganisir di kota metropolis yang kelam.',
  },
  {
    'id': 'm9',
    'title': 'Suzume no Tojimari: The Door',
    'genre': 'disaster - adventure - fantasy',
    'rating': '8.2',
    'price': 59000,
    'duration': '2j 30m',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsbrX-FgTWDbtw6Il6dY-UdYFDJoIGSnKi6NnQz4zBiA&s',
    'banner': 'https://images.unsplash.com/photo-1478760329108-5c3ed9d495a0?w=800&q=80',
    'synopsis': 'Detektif bayangan melawan jaringan kejahatan yang terorganisir di kota metropolis yang kelam.',
  },
  {
    'id': 'm10',
    'title': 'Kimi no Na wa: The Reunion',
    'genre': 'Disaster - Romance - Drama - Fantasy',
    'rating': '8.6',
    'price': 43000,
    'duration': '2j 30m',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH_7RxCW3z-pBtDyKqz0UvrsLczs0Zsyxs6npOES0A9g&s=10',
    'banner': 'https://images.unsplash.com/photo-1478760329108-5c3ed9d495a0?w=800&q=80',
    'synopsis': 'Detektif bayangan melawan jaringan kejahatan yang terorganisir di kota metropolis yang kelam.',
  },
];

// ==========================================
// PAGE 1: DAFTAR ITEM (KATALOG FILM & PROMO)
// ==========================================
class MovieListPage extends StatefulWidget {
  // ignore: use_super_parameters
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  int _selectedCategoryIndex = 0;
  final List<String> categories = [
    'Now Showing',
    'Upcoming',
    'IMAX 3D',
    'VIP Cinema',
  ];

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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
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
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.confirmation_number_outlined,
                      size: 50,
                      color: Colors.white38,
                    ),
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFFFB400)
                              : const Color(0xFF252525),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.white70,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
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
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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
                          builder: (context) =>
                              BookingDetailPage(movieData: movie),
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
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
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
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Color(0xFFFFB400),
                                          size: 12,
                                        ),
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
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      child: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 10,
                                        color: Colors.white,
                                      ),
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
