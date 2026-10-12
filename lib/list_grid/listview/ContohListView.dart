// ignore_for_file: file_names, use_super_parameters

import 'package:flutter/material.dart';

class ContohListView extends StatelessWidget {
  const ContohListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          // list vertikal
          const Text(
            'ListView vertikal',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 20),

          SizedBox(
            height: 250,

            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.blue),
                    title: Text('Item ${index + 1}'),
                    subtitle: Text('Contoh item vertikal'),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 24),

          // list horizontal
          Text(
            'list view Horizontal',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 10),

          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 130,
                  margin: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Center(
                    child: Text(
                      'Card ${index + 1}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
