// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Latihan3 extends StatelessWidget {
  const Latihan3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          color: Colors.amber,
          width: 200,
          height: 50,
          margin: EdgeInsets.all(10),

          child: Row(
            children: [
              Padding(padding: EdgeInsets.all(35)),
              Text("Persib"),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey,
              width: 100,
              height: 100,
              margin: EdgeInsets.all(10),

              child: Row(
                children: [
                  Container(
                    color: Colors.red,
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Text("Logo", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey,
              width: 100,
              height: 100,
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    color: Colors.red,
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Text("Logo", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.grey,
                    width: 220,
                    height: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.amber,
                          margin: EdgeInsets.all(10),
                          width: 200,
                          height: 130,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "lorem ipsumaks aksjdakndka askjdnaksjd nkad",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.grey,
                    width: 220,
                    height: 130,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.amber,
                          width: 200,
                          height: 130,
                          margin: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "lorem ipsumaks aksjdakndka askjdnaksjd nkad",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
