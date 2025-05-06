import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../services/chat_service.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  const ChatScreen({super.key, required this.chatId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Message>>(
              stream: ChatService().getMessages(widget.chatId),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                return ListView(
                  children: snapshot.data!
                      .map((msg) => ListTile(title: Text(msg.text)))
                      .toList(),
                );
              },
            ),
          ),
          TextField(
            controller: _controller,
            onSubmitted: (val) {
              ChatService().sendMessage(widget.chatId, val);
              _controller.clear();
            },
            decoration: const InputDecoration(labelText: 'Digite uma mensagem'),
          )
        ],
      ),
    );
  }
}
