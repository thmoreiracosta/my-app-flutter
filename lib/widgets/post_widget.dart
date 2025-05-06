import 'package:flutter/material.dart';
import '../models/post_model.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(post.author),
        subtitle: Text(post.content),
      ),
    );
  }
}