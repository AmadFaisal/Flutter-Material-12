import 'package:flutter/material.dart';

class BasicListview extends StatelessWidget {
  const BasicListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List View')),
      body: ListView(
        children: [
          ListTile(
            title: Text("Baransel.dev"),
            subtitle: Text("https://baransel.dev"),
            leading: Icon(Icons.arrow_forward_ios_outlined), // icon di awal
            textColor: Colors.blue,
          ),
          ListTile(
            title: Text("Flutter"),
            subtitle: Text("https://flutter"),
            trailing: Icon(Icons.auto_awesome), // icon di akhir
          ),
          ListTile(
            title: Text("Courses"),
            subtitle: Text("https://courses"),
            trailing: Icon(Icons.audiotrack), // icon di akhir
          ),
        ],
      ),
    );
  }
}
