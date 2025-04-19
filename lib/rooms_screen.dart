import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({super.key});

  static const List<_Room> rooms = [
    _Room('Games', 'assets/images/games_bg.png'),
    _Room('Business', 'assets/images/business_bg.png'),
    _Room('Public Health', 'assets/images/health_bg.png'),
    _Room('Study', 'assets/images/study_bg.png'),
  ];

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select A Room')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Text('Menu')),
            const ListTile(title: Text('Message Boards')),
            const ListTile(title: Text('Profile')),
            const ListTile(title: Text('Settings')),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () => logout(context),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (ctx, i) {
          final room = rooms[i];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(roomName: room.name),
                ),
              );
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
