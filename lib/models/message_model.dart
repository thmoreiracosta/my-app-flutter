import 'package:cloud_firestore/cloud_firestore.dart';


class Message {
  final String text;
  final DateTime timestamp;

  Message({
    required this.text,
    required this.timestamp,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      text: map['text'],
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }
}
