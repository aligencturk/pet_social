import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_widget.dart';
import 'home/home_screen.dart';
import 'discover/discover_screen.dart';
import 'community/community_screen.dart';
import 'profile/profile_screen.dart';
import 'new_post/new_post_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  // Method to change tab programmatically
  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> get _screens => [
    HomeScreen(onTabChange: changeTab),
    const DiscoverScreen(),
    const NewPostScreen(),
    const CommunityScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}


