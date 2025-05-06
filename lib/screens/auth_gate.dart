import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart'; // Importe o modelo AppUser
import 'login_screen.dart';
import '../widgets/user_card.dart'; // Importe o widget UserCard

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
          // Se o usuário estiver logado, cria o AppUser
          User firebaseUser = snapshot.data!;
          AppUser appUser = AppUser(
            id: firebaseUser.uid,
            name: firebaseUser.displayName ?? 'Nome não disponível',
            photoUrl: firebaseUser.photoURL ?? 'URL não disponível',
            bio: 'Bio do usuário', // Pode ser substituído por dados do Firestore
            specialty: 'Especialidade do usuário', // Pode ser substituído por dados do Firestore
          );

          return UserCard(user: appUser); // Passando o AppUser para o UserCard
        } else {
          return const LoginScreen(); // Se não houver dados de autenticação, exibe o Login
        }
      },
    );
  }
}
