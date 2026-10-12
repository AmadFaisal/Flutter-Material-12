// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class LayoutProfile2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.image, size: 60, color: Colors.grey),
          ),

          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.red,
              child: const Text('-20%', style: TextStyle(color: Colors.white)),
            ),
          ),

          const Positioned(
            bottom: 8,
            right: 8,
            child: Icon(Icons.favorite_border, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
