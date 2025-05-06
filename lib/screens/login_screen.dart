import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      _showError(context, 'Erro ao entrar com Google: $e');
    }
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      _showError(context, 'Erro no login anônimo: $e');
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.indigo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              'ViaAxis',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Conecte alunos e trainees',
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            const SizedBox(height: 40),
            _socialButton(
              context,
              label: 'Entrar com Google',
              color: Colors.white,
              textColor: Colors.black87,
              icon: Icons.g_mobiledata,
              onPressed: () => _signInWithGoogle(context),
            ),
            const SizedBox(height: 16),
            _socialButton(
              context,
              label: 'Entrar anonimamente',
              color: Colors.white10,
              textColor: Colors.white,
              icon: Icons.lock_open,
              onPressed: () => _signInAnonymously(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialButton(BuildContext context,
      {required String label,
      required Color color,
      required Color textColor,
      required IconData icon,
      required VoidCallback onPressed}) {
    return SizedBox(
      width: 280,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        icon: Icon(icon),
        label: Text(label, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
