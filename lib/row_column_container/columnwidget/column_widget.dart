import 'package:flutter/material.dart';

class Columnwidget extends StatelessWidget {
  const Columnwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Ini isi column1"),
        Text("Ini isi column2"),
        Text("Ini isi column3"),
        FlutterLogo(size: 50, textColor: Colors.blue),
      ],
    );
  }
}
