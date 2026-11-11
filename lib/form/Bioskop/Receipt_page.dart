import 'package:flutter/material.dart';


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