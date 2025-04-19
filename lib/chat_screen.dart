import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  final String roomName;

  const ChatScreen({required this.roomName, super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void sendMessage() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && _controller.text.trim().isNotEmpty) {
      _firestore
          .collection('chatrooms')
          .doc(widget.roomName)
          .collection('messages')
          .add({
            'text': _controller.text.trim(),
            'sender': user.email,
            'timestamp': FieldValue.serverTimestamp(),
          });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final messagesRef = _firestore
        .collection('chatrooms')
        .doc(widget.roomName)
        .collection('messages')
        .orderBy('timestamp', descending: true);

    return Scaffold(
      appBar: AppBar(title: Text('${widget.roomName} Room')),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: messagesRef.snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (ctx, index) {
                    final msg = messages[index].data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text(msg['sender'] ?? 'Unknown'),
                      subtitle: Text(msg['text'] ?? ''),
                      trailing: Text(
                        (msg['timestamp'] != null)
                            ? (msg['timestamp'] as Timestamp)
                                .toDate()
                                .toLocal()
                                .toString()
                                .substring(11, 16)
                            : '',
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
