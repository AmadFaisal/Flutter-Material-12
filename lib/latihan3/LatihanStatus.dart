import 'package:flutter/material.dart';

class LatihanStatus extends StatelessWidget {
  const LatihanStatus({super.key});

  final List<Map<String, String>> users = const [
    {
      'name': 'amad',
      'image': 'https://images.unsplash.com/photo-1791909153793-3261b1f9b217?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
      'profile': 'https://images.unsplash.com/photo-1791973649016-541e9784d792?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    },
    {
      'name': 'ryan',
      'image': 'https://images.unsplash.com/photo-1791921597945-adcedaed3115?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
      'profile': 'https://images.unsplash.com/photo-1791542877888-1e019b86fd9b?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    },
    {
      'name': 'ronaldo',
      'image': 'https://images.unsplash.com/photo-1772289935478-d52178bfc9a3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
      'profile': 'https://images.unsplash.com/photo-1787041996963-a72b5e7fb1a1?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    },
    {
      'name': 'messi',
      'image': 'https://images.unsplash.com/photo-1791718755802-6bda3ee14af4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
      'profile': 'https://images.unsplash.com/photo-1791545717824-e06d96b48111?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
          tooltip: 'Back',
        ),
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 1. STORY
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(user['profile']!),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user['name']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(color: Colors.grey, height: 1),

          // 2. FEED
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user['profile']!),
                      ),
                      title: Text(
                        user['name']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ),
                    Image.network(
                      user['image']!,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      children: const [
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.chat_bubble_outline,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: null,
                          icon: Icon(Icons.send, color: Colors.white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '${user['name']} Ini caption postingan',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
