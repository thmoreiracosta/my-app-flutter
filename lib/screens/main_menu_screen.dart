import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'feed_screen.dart';
import 'home_map_screen.dart';
import 'chat_screen.dart';
import 'profile_screen.dart';
import '../models/user_model.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  int _selectedIndex = 0;

  // Usuário genérico fictício (simula dados para perfil)
  final AppUser user = AppUser(
    id: '001',
    name: 'João da Silva',
    photoUrl: 'https://via.placeholder.com/150',
    bio: 'Apaixonado por tecnologia e ensino',
    specialty: 'Desenvolvedor Flutter',
  );

  static const String chatId = 'chat001';

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      const HomeScreen(),
      const FeedScreen(),
      const HomeMapScreen(),
      const ChatScreen(chatId: chatId),
      ProfileScreen(user: user),
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
