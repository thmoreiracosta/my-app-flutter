import 'package:flutter/material.dart';
import '../widgets/post_widget.dart';
import '../services/firestore_service.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feed')),
      body: StreamBuilder(
        stream: FirestoreService().getPosts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          final posts = snapshot.data!;
          return ListView(
            children: posts.map((p) => PostWidget(post: p)).toList(),
          );
        },
      ),
    );
  }
}
