import 'package:flutter/material.dart';
import 'package:rpl2/form/Bioskop/Receipt_page.dart';

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
final int seatCols = 10;
// Daftar kursi yang sudah terisi orang lain (Booked/Occupied)
final List<String> reservedSeats = ['A2', 'B4', 'C1', 'C2', 'D5', 'D6', 'A5', 'B7', 'C8', 'D9'];

// ====================================================================================
// PAGE 2: DETAIL ITEMS (SEAT SELECTION + MULTI ITEM: TIKET & SNACK) & PAYMENT
// ====================================================================================
class BookingDetailPage extends StatefulWidget {
  final Map<String, dynamic> movieData;

  const BookingDetailPage({Key? key, required this.movieData})
    : super(key: key);

  @override
  State<BookingDetailPage> createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends State<BookingDetailPage> {
  List<String> selectedSeats = []; // Default pilih 1 kursi
  Map<String, int> snackQuantities = {};
  String selectedPaymentMethod = 'CASH'; // Options: 'QRIS', 'CASH'
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
        title: const Text(
          'Pilih Kursi & Detail Bayar',
          style: TextStyle(fontSize: 16),
        ),
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
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.movieData['genre'],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Durasi: ${widget.movieData['duration']}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Rp ${widget.movieData['price']} / seat',
                        style: const TextStyle(
                          color: Color(0xFFFFB400),
                          fontWeight: FontWeight.bold,
                        ),
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
            const Text(
              'Pilih Tempat Duduk Bioskop',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
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
                  const Text(
                    'LAYAR BIOSKOP',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      letterSpacing: 2,
                    ),
                  ),
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
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: seatColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFFFFB400)
                                  : Colors.white10,
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
                                    : (isSelected
                                          ? Colors.white
                                          : Colors.white70),
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
                  const Text(
                    'Kursi Terpilih:',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  Text(
                    selectedSeats.isEmpty
                        ? 'Belum Ada'
                        : selectedSeats.join(' '),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFB400),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Divider(color: Colors.white24),
            const SizedBox(height: 10),

            // MULTI ITEM: Snack & Beverage Selection
            const Text(
              'Tambah Snack & Minuman (Opsional)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        snack['icon'] as IconData,
                        color: const Color(0xFFFFB400),
                        size: 26,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snack['name'],
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Rp ${snack['price']}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 11,
                              ),
                            ),
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
                              decoration: const BoxDecoration(
                                color: Colors.black26,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.remove,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              '$currentQty',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                snackQuantities[snackId] = currentQty + 1;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Color(0xFFE50914),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
            const Divider(color: Colors.white24),
            const SizedBox(height: 10),

            // Metode Pembayaran (CASH & QRIS)
            const Text(
              'Metode Pembayaran',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedPaymentMethod = 'QRIS'),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: selectedPaymentMethod == 'QRIS'
                            ? const Color(0xFFE50914).withOpacity(0.2)
                            : const Color(0xFF1E1E1E),
                        border: Border.all(
                          color: selectedPaymentMethod == 'QRIS'
                              ? const Color(0xFFE50914)
                              : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: const [
                          Icon(Icons.qr_code_scanner, color: Colors.white),
                          SizedBox(height: 6),
                          Text(
                            'QRIS Instant',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
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
                        color: selectedPaymentMethod == 'CASH'
                            ? const Color(0xFFE50914).withOpacity(0.2)
                            : const Color(0xFF1E1E1E),
                        border: Border.all(
                          color: selectedPaymentMethod == 'CASH'
                              ? const Color(0xFFE50914)
                              : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: const [
                          Icon(Icons.payments, color: Colors.white),
                          SizedBox(height: 6),
                          Text(
                            'Cash / Tunai',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
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
                    const Text(
                      'Nominal Uang Tunai (Rp):',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
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
                      Text(
                        'Tiket ($ticketQty x):',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Rp $ticketTotalPrice',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Snack:',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Rp $snackTotalPrice',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.white24, height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Grand Total:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Rp $grandTotal',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFFFFB400),
                        ),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
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
                  if (selectedPaymentMethod == 'CASH' &&
                      cashPaid < grandTotal) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Uang tunai tidak mencukupi total pembayaran!',
                        ),
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
                    'change': selectedPaymentMethod == 'CASH'
                        ? (cashPaid - grandTotal)
                        : 0,
                    'bookingId':
                        'CS-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
                    'date':
                        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}',
                  };

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ReceiptPage(transactionData: transactionData),
                    ),
                  );
                },
                child: const Text(
                  'Konfirmasi & Bayar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
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
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }
}
