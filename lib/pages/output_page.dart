import 'package:flutter/material.dart';

class OutputFormScreen extends StatelessWidget {
	const OutputFormScreen({
		super.key,
		required this.nama,
		required this.jk,
		required this.tglLahir,
		required this.agama,
	});

	final String nama;
	final String jk;
	final String tglLahir;
	final String agama;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: const Text('Data Biodata')),
			body: SafeArea(
        child: Card(
          elevation: 4,
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Data Biodata",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 18),
                  _DataRow(label: "Nama", value: nama),
                  _DataRow(label: "Jenis Kelamin", value: jk),
                  _DataRow(label: "Tanggal Lahir", value: tglLahir),
                  _DataRow(label: "Agama", value: agama),
                ],
              ),
            ),
          ),
        )
      );
	}
}

class _DataRow extends StatelessWidget {
	const _DataRow({required this.label, required this.value});

	final String label;
	final String value;

	@override
	Widget build(BuildContext context) {
		return ListTile(title: Text(label), subtitle: Text(value));
	}
}
