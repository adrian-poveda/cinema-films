import 'package:cinema_films/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _name = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color.fromRGBO(21, 32, 44, 1),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _createLogo(),
              Divider(),
              _createInput(),
              Divider(),
              _createPasswordInput(),
              Divider(),
              Divider(),
              Divider(),
              _createLoginButton(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _createInput() {
    return TextField(
      style: TextStyle(
        color: Colors.white
      ),
      autofocus: false,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        //counter: Text('${_name.length} characters'),
        //hintText: 'Your Name',
        labelText: 'Username',
        //helperText: 'Write your name',
        //suffixIcon: Icon(Icons.accessibility),
        //icon: Icon(Icons.account_circle, size: 50)
      ),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createPasswordInput() {

    return new TextField(
      style: TextStyle(
        color: Colors.white
      ),
      cursorColor: Colors.blue,
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.blue)),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20),
        //   borderSide: BorderSide(
        //     color: Colors.black
        //   )
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20),
        //   borderSide: BorderSide(
        //     color: Colors.blue,
        //   )
        // ),
        //hintText: 'Your Name',
        labelText: 'Password',
        // labelStyle: TextStyle(
        //   color: myfocus.hasFocus ? Colors.blue : Colors.grey
        // )
        //helperText: 'Write your name',
        //suffixIcon: Icon(Icons.accessibility),
        //icon: Icon(Icons.lock_outline, size: 50)
      ),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _createLogo() {
    return Center(
      child: Column(
        children: [
          Container(
            child: Icon(
              Icons.local_movies,
              size: 50,
              color: Colors.blue,
            ),
          ),
          Container(
              child: Text(
            'LOGIN',
            style: TextStyle(fontSize: 50, color: Colors.blue),
          )),
        ],
      ),
    );
  }

  Widget _createLoginButton() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(15)),
      child: ButtonTheme(
        height: 50,
        minWidth: double.infinity,
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, 'home');
            //Navigator.pushReplacementNamed(context, 'home');
          },
          child: Text('Sign in'),
        ),
      ),
    );
  }
}
