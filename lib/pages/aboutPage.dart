import 'package:flutter/material.dart';
import 'package:rpl2/pages/aboutPage.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Halaman About'),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Kembali ke Halaman Home'),
          ),
        ],
      ),
    );
  }
}
