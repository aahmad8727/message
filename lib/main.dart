import 'package:flutter/material.dart';

void main() {
  runApp(const ChatboardsApp());
}

class ChatboardsApp extends StatelessWidget {
  const ChatboardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatboards',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RoomsScreen(),
    );
  }
}

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({super.key});

  final List<_Room> rooms = const [
    _Room('Games', 'assets/images/games_bg.png'),
    _Room('Business', 'assets/images/business_bg.png'),
    _Room('Public Health', 'assets/images/health_bg.png'),
    _Room('Study', 'assets/images/study_bg.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select A Room')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(child: Text('Menu')),
            ListTile(title: Text('Message Boards')),
            ListTile(title: Text('Profile')),
            ListTile(title: Text('Settings')),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (ctx, i) {
          final room = rooms[i];
          return GestureDetector(
            onTap: () {
              // TODO: navigate to chat screen for `room.name`
            },
            child: Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(room.assetPath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Text(
                room.name,
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Room {
  final String name;
  final String assetPath;
  const _Room(this.name, this.assetPath);
}
