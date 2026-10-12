import 'package:flutter/material.dart';

class sizeBoxWid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text("Hallo 1"),
          SizedBox(height: 35,),
          SizedBox(height: 100, width: 100, child: Text("ini size box")),
          Text("Hallo 3"),
          SizedBox(
            width: 150,
            height: 24,
            child: ElevatedButton(onPressed: () {}, child: Text("Button")),
          ),
        ],
      ),
    );
  }
}
