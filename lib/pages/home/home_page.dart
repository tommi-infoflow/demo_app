import 'package:demo_app/pages/home/dashboard/dashboard_page.dart';
import 'package:demo_app/pages/home/favorite/favorite_page.dart';
import 'package:demo_app/pages/home/search/search_page.dart';
import 'package:demo_app/pages/home/setting/setting_page.dart';
import 'package:demo_app/pages/home/widgets/MyScaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    DashboardPage(),
    SearchPage(),
    FavoritePage(),
    SettingPage(),
  ];

  int _selectedPageIndex = 0;
  void _onPageIndexChanged(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.movie), title: Text('Dashboard')),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), title: Text('Search')),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), title: Text('Favorite')),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), title: Text('Setting')),
      ],
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blue,
      currentIndex: _selectedPageIndex,
      onTap: _onPageIndexChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      header: AppBar(
        title: Text('Movie API'),
      ),
      body: _pages[_selectedPageIndex],
      footer: _buildBottomNavigationBar(),
    );
  }

  
}
