import 'package:demo_app/presentation/pages/home/dashboard/dashboard_page.dart';
import 'package:demo_app/presentation/pages/home/favorite/favorite_page.dart';
import 'package:demo_app/presentation/pages/home/search/search_page.dart';
import 'package:demo_app/presentation/pages/home/setting/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _title = 'Dashboard Page';

  getPref() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print('saved token : ${_prefs.getString("userToken")}');
  }

  final List<Widget> _pages = [
    DashboardPage(),
    SearchPage(),
    FavoritePage(),
    SettingPage(),
  ];

  final List<String> _titles = [
    'Dashboard Page',
    'Search Movie Page',
    'Favorite Movie Page',
    'Setting Page',
  ];

  int _selectedPageIndex = 0;
  void _onPageIndexChanged(int value) {
    setState(() {
      _title = _titles[value];
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
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  
}
