import 'package:cinema_films/src/pages/film_detail.dart';
import 'package:cinema_films/src/pages/home_page.dart';
import 'package:cinema_films/src/pages/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cinema films',
        initialRoute: '/',
        routes: {
          //'/': (BuildContext context) => LoginPage(),
          '/': (BuildContext context) => HomePage(),
          'detail': (BuildContext context) => DetailFilm()
        });
  }
}
