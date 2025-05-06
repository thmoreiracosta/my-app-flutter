import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message_model.dart';

class ChatService {
  Stream<List<Message>> getMessages(String chatId) {
    return FirebaseFirestore.instance
        .collection('chats/$chatId/messages')
        .orderBy('timestamp')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Message.fromMap(doc.data())).toList());
  }

  Future<void> sendMessage(String chatId, String text) async {
    await FirebaseFirestore.instance
        .collection('chats/$chatId/messages')
        .add({'text': text, 'timestamp': Timestamp.now()});
  }
}
