import 'package:flutter/material.dart';
import '../widgets/user_card.dart';
import '../widgets/post_widget.dart';
import '../models/user_model.dart';
import '../models/post_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dados fictícios de exemplo
    final user = AppUser(
      id: '001',
      name: 'João da Silva',
      specialty: 'Desenvolvedor Flutter',
      bio: 'Apaixonado por tecnologia e ensino',
      photoUrl: 'https://via.placeholder.com/150',
    );

    final post = Post(
      id: 'p001',
      author: 'João da Silva',
      content: 'Hoje estudei sobre ListTile no Flutter!',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('ViaAxis'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          UserCard(user: user),
          const SizedBox(height: 10),
          PostWidget(post: post),
        ],
      ),
    );
  }
}
