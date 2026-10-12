import 'package:flutter/material.dart';


class RowColumnWidget extends StatelessWidget {
  const RowColumnWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.grey[300],
        height: 64,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.call, size: 26,), Text("Call")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.mouse, size: 26,), Text("Phone")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.share, size: 26,), Text("Share")
              ],
            ),
           
          ],
        ),
      ),
    
    );
  }
}