import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profiletwit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black,
        width: 460,
        height: 600,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  // color: Colors.amberAccent,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1542051841857-5f90071e7989?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.search_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),

                          SizedBox(width: 20),

                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              'images/grok-dark.svg',
                              height: 20,
                            ),
                          ),
                          SizedBox(width: 20),

                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.more_horiz_sharp,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Positioned(
                  left: 15,
                  bottom: -82,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amberAccent,
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://images.unsplash.com/photo-1790872074149-e21e49eb1aad?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxMnx8fGVufDB8fHx8fA%3D%3D',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 20,
                  bottom: -250,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Temmola',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        '@semolatex',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),

                      SizedBox(height: 15),

                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white70,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Garut, Jawa Barat',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 15),

                      Row(
                        children: [
                          Icon(
                            Icons.link_outlined,
                            color: Colors.blue,
                            size: 16,
                          ),
                          SizedBox(width: 2),
                          Text(
                            'www.temmola.com/@temmola',
                            style: TextStyle(fontSize: 14, color: Colors.blue),
                          ),
                        ],
                      ),

                      SizedBox(height: 15),

                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.white70,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Born August 8, 2009',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.local_offer_outlined,
                            color: Colors.white70,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Joined January 2026',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
