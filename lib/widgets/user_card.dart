import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserCard extends StatelessWidget {
  final AppUser user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card( // <- Aqui está o widget Material
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(user.photoUrl)),
        title: Text(user.name),
        subtitle: Text(user.specialty),
        trailing: const Icon(Icons.chat),
      ),
    );
  }
}
