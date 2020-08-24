import 'package:cinema_films/pages/home_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema films',
      initialRoute: '/',
      routes: {
        '/' : ( BuildContext context ) => HomePage()
      },
    );
  }
}