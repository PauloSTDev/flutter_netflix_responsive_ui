import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/screens/home_screen.dart';

class NavScreen extends StatefulWidget {

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = const {
    "Home" : Icons.home,
    "Search" : Icons.search,
    "Coming Soon" : Icons.queue_play_next,
    "More" : Icons.menu,
  };

  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
