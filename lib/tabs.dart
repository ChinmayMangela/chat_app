import 'package:chat_application/common/domain/bottom_nav_bar_item.dart';
import 'package:chat_application/features/chats/presentation/pages/chats_page.dart';
import 'package:chat_application/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';

const List<BottomNavBarItemModel> _tabs = [
  BottomNavBarItemModel(name: 'Chat', icon: Icons.chat),
  BottomNavBarItemModel(name: 'Profile', icon: Icons.person),
];

const List<Widget> _pages = [
  ChatsPage(),
  ProfilePage(),
];

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  var _selectedIndex = 0;

  void _changePage(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _changePage,
      items: _tabs.map((tab) {
        return BottomNavigationBarItem(icon: Icon(tab.icon), label: tab.name);
      }).toList(),
    );
  }
}
