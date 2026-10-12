import 'package:flutter/material.dart';

class BuilderListView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 25,
        itemExtent: 64,
        itemBuilder: (context, index) =>
            ListTile(title: Text('Message ${index + 1}')),
      ),
    );
  }
}
