import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _sendMessage() async {
    User? user = _auth.currentUser; // Hozirgi foydalanuvchini olamiz

    if (_messageController.text.isNotEmpty && user != null) {
      _firestore.collection('messages').add({
        'text': _messageController.text,
        'senderUid': user.uid, // Xabarni foydalanuvchi bilan bog'laymiz
        'timestamp': FieldValue.serverTimestamp(),
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    User? currentUser = _auth.currentUser; // Hozirgi foydalanuvchi

    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                var messages = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true, // Xabarlar pastdan yuqoriga ko'rsatiladi
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    var message = messages[index];

                    // Hujjatni Map<String, dynamic> sifatida casting qilamiz
                    var messageData = message.data() as Map<String, dynamic>;

                    // Agar "senderUid" mavjud bo'lsa, uni tekshiramiz, bo'lmasa default qiymat beramiz
                    var senderUid = messageData.containsKey('senderUid')
                        ? messageData['senderUid']
                        : null;

                    var isMe = senderUid ==
                        currentUser?.uid; // O'zimning xabarim yoki yo'q

                    return Align(
                      alignment: isMe
                          ? Alignment.centerRight
                          : Alignment
                              .centerLeft, // O'ng yoki chap tomonda joylashtiramiz
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.blue : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          messageData['text'] ?? '',
                          style: TextStyle(
                            color: isMe ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      labelText: 'Xabar yozing',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
