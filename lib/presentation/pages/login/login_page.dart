import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _userToken;

  Future<void> _saveUserToken() async {
    final _token = _userToken.text;

    final _prefs = await SharedPreferences.getInstance();
    _prefs.setString("userToken", _token);
  }

  @override
  void initState() {
    super.initState();
    _userToken = TextEditingController();
  }

  @override
  void dispose() {
    _userToken.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _userToken,
                  validator: (value) {
                    if (value.length == 0) {
                      return 'User Token must be filled';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'User Token',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                ),
                RaisedButton(
                    child: Text('Login'),
                    color: Colors.blue,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _saveUserToken();
                        Navigator.of(context).pushReplacementNamed('/home');

                        // Navigator.of(context)
                        //     .pushReplacement(MaterialPageRoute(builder: (_) {
                        //   return HomePage();
                        // }));
                      }
                    }),
              ],
            )),
      ),
    );
  }
}
