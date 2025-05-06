import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  final AppUser user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Column(
        children: [
          CircleAvatar(radius: 40, backgroundImage: NetworkImage(user.photoUrl)),
          Text(user.bio),
          Text(user.specialty),
        ],
      ),
    );
  }
}
