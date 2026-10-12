import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(color: Colors.grey, width: 84, height: 84, child: Text("box 1"),),
        Expanded(child: Container(color: Colors.grey, height: 84, child: Text("box 2"),)),
        Expanded(child: Container(color: Colors.lightBlue, height: 84, child: Text("box 3"),)),
        Expanded(flex: 2, child: Container(color: Colors.amber, height: 84, child: Text("box 4"),)),
        Expanded(
          flex: 3,
          child: Container(color: Colors.greenAccent, height: 84, child: Text("box 5"),),
        ),
      ],
    );
  }
}
