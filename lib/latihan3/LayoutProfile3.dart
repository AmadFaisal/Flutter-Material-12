// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class LayoutProfile3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 80,
              color: Colors.blue[100],
              alignment: Alignment.center,
              child: const Text("Pemasukan"),
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Container(
              height: 80,
              color: Colors.green[100],
              alignment: Alignment.center,
              child: const Text("Pengeluaran"),
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Container(
              height: 80,
              color: Colors.orange[100],
              alignment: Alignment.center,
              child: const Text("Saldo"),
            ),
          ),
        ],
      ),
    );
  }
}
