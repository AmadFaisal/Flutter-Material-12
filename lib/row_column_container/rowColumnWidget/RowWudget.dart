import 'package:flutter/material.dart';


class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Ini isi row1"),
        Text("Ini isi row2"),
        Text("Ini isi row3"),
        FlutterLogo(
          size: 50,
          textColor: Colors.blue,
        )
      ],
    );
  }
}