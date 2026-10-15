import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GridBasic extends StatelessWidget {
  // const GridBasic({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery fungsi nya untuk menentukan ketinggian dan lebar
    // dari layout yang kita buat responsive

    var mediaQueryData = MediaQuery.of(context);
    final double widthScreen = mediaQueryData.size.width;
    final double heightScreen = mediaQueryData.size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Grid View')),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: widthScreen / heightScreen,
        // mainAxisExtent: 50,
        // scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        // dragStartBehavior: DragStartBehavior.down,
        // reverse: true,
        padding: EdgeInsets.all(8),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(child: Text("1")),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.lightGreenAccent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(child: Text("2")),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(child: Text("3")),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(child: Text("4")),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(child: Text("5")),
          ),
          Container(
            color: Colors.redAccent,
            child: Center(child: Text("6")),
          ),
        ],
      ),
    );
  }
}
