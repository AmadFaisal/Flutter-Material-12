import 'package:flutter/material.dart';

class GridBuilderProduct extends StatelessWidget {
  const GridBuilderProduct({super.key});

  final List<Map<String, String>> products = const [
    {
      'name': 'Laptop Flutter',
      'price': 'Rp3.000.000',
      'image': 'https://media.istockphoto.com/id/2220578551/photo/professional-businessperson-analyzing-data-analytics-report-on-laptop-in-conference-room.webp?a=1&b=1&s=612x612&w=0&k=20&c=u8GKOxby9i-_DLm0T34xJaUT-ugpY4g-tHT9gD6UBAI=',
    },
    {
      'name': 'Arduino ',
      'price': 'Rp5.000.000',
      'image': 'https://images.unsplash.com/photo-1603732551658-5fabbafa84eb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    },
    {
      'name': 'SmartWatch',
      'price': 'Rp2.000.000',
      'image': 'https://images.unsplash.com/photo-1579586337278-3befd40fd17a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    },
    {
      'name': 'Kaos',
      'price': 'Rp50.000',
      'image': 'https://plus.unsplash.com/premium_photo-1663858367001-89e5c92d1e0e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    },
    {
      'name': 'Mangkok',
      'price': 'Rp20.000',
      'image': 'https://media.istockphoto.com/id/1287597362/photo/kintsugi-grey-bowl-repaired-with-gold.webp?a=1&b=1&s=612x612&w=0&k=20&c=Ldrz4hCbgus2r43_j7ioZ9fzGWETnimdwsyryzQLXzM=',
    },
    {
      'name': 'Mouse',
      'price': 'Rp20.000',
      'image': 'https://images.unsplash.com/photo-1527814050087-3793815479db?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    final double widthScreen = mediaQueryData.size.width;
    final double heightScreen = mediaQueryData.size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Grid Builder')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: widthScreen / heightScreen,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[100],
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.1)),
                ],
              ),

              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        product['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // color: Colors.black,
                    ),
                  ),

                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          product['price']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
