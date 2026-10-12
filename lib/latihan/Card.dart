import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8),
        color: Colors.blueGrey,
        height: 250,
        width: 190,
        margin: EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Container(
            color: Colors.red,
            height: 50,
            width: 100,
          ),
          
        ),
      ),
    );
  }
}
