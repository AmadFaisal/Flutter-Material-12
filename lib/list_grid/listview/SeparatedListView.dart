import 'package:flutter/material.dart';

class SeparatedListView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: 30,
        itemBuilder: (context, index) =>
            ListTile(title: Text('Contact ${index + 1}')),

        separatorBuilder: (context, index) => Divider(height: 2),
      ),
    );
  }
}
