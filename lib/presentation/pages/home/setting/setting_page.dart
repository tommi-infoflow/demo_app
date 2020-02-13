import 'package:demo_app/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  initState() {
    super.initState();
    isShow();
  }

  isShow() async {
    final _prefs = await SharedPreferences.getInstance();
    setState(() {
      _isChecked = _prefs.getBool('showRecomended');
    });
  }

  bool _isChecked = false;
  _toggleCheckbox(value) async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('showRecomended', value);

    setState(() {
      _isChecked = value;
    });
  }

  Future<void> _logout() async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.remove('userToken');

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return LoginPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildRecommend(),
              Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
              _buildButtonLogout(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecommend() {
    return Row(
      children: <Widget>[
        Expanded(child: Text('Show Recommended')),
        Checkbox(
            value: _isChecked,
            onChanged: (value) {
              _toggleCheckbox(value);
            }),
      ],
    );
  }

  Widget _buildButtonLogout() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Logout'),
      onPressed: () {
        _logout();
      },
    );
  }
}
