import 'package:flutter/material.dart';

class StackWid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(width: 300, height: 300, color: Colors.blueGrey),
        Positioned(
          left: 10,
          bottom: 10,
          child: Icon(Icons.phone, size: 50, color: Colors.greenAccent),
        ),
        Positioned(
          top: 10,
          child: Icon(Icons.search, size: 50, color: Colors.white),
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: Icon(Icons.favorite_outline, size: 50, color: Colors.red),
        ),
      ],
    );
  }
}
