import 'package:flutter/material.dart';

import 'package:cinema_films/src/models/film.dart';
import 'package:cinema_films/src/providers/films_provider.dart';
import 'package:cinema_films/src/search/search_delegate.dart';
import 'package:cinema_films/src/widgets/card_swiper.dart';
import 'package:cinema_films/src/widgets/popular_movie.dart';

class HomePage extends StatelessWidget {
  final filmsProvider = new FilmsProvider();

  @override
  Widget build(BuildContext context) {
    //Cuando se carga la página llamamos al getPopulares para obtener las peliculas
    filmsProvider.getPopularFilms();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text('Movies playing now'),
        backgroundColor: Color.fromRGBO(21, 32, 44, 1),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearch(),
                //query: 'Texto precargado'
              );
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(21, 32, 44, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [_filmSwiper(), _footer(context)],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   elevation: 5,
      //   backgroundColor: Color.fromRGBO(21, 32, 44, 1),
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.local_movies), title: Text('Home')),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.list),
      //       title: Text('My list'),
      //     ),
      //   ],
      // ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     centerTitle: false,
    //     title: Text('Movies playing now'),
    //     backgroundColor: Colors.indigo,
    //     actions: [
    //       IconButton(
    //         icon: Icon(Icons.search),
    //         onPressed: () {
    //           showSearch(
    //             context: context,
    //             delegate: DataSearch(),
    //             //query: 'Texto precargado'
    //           );
    //         },
    //       )
    //     ],
    //   ),
    //   body: Stack(
    //     children: [
    //       _appBackground(),
    //       Container(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             _filmSwiper(),
    //             _footer(context)
    //           ],
    //         ),
    //       )

    //     ],
    //   )
    // );
  }

  _filmSwiper() {
    return FutureBuilder(
      future: filmsProvider.getNowPlayingFilms(),
      builder: (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(
            films: snapshot.data,
          );
        } else {
          return Container(
              height: 300, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(left: 20),
                child: Text('Popular movies',
                    style: TextStyle(color: Colors.white, fontSize: 17))),
            SizedBox(height: 30),
            StreamBuilder(
              stream: filmsProvider.popularsStream,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {
                if (snapshot.hasData) {
                  return PopularFilm(
                      films: snapshot.data,
                      nextPage: filmsProvider.getPopularFilms);
                } else {
                  return Container(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()));
                }
              },
            )
          ],
        ));
  }

  // Widget _appBackground() {
  //   final gradientBackground = Container(
  //     width: double.infinity,
  //     height: double.infinity,
  //     decoration: BoxDecoration(
  //         gradient: LinearGradient(
  //             begin: FractionalOffset(0.0, 0.6),
  //             end: FractionalOffset(0.0, 1.0),
  //             colors: [
  //           Color.fromRGBO(43, 43, 43, 1),
  //           Color.fromRGBO(43, 43, 43, 1),
  //         ])),
  //   );

  //   return Stack(
  //     children: [
  //       //gradientBackground
  //       Container(
  //         decoration: BoxDecoration(
  //           color: Color.fromRGBO(50, 55, 57, 1),
  //         ),
  //       )
  //     ],
  //   );
  // }

  // Widget _circularBackground() {
  //   final circle = Transform.rotate(
  //       angle: -pi / 5.0,
  //       child: Container(
  //         height: 2000,
  //         width: 4000,
  //         decoration: BoxDecoration(color: Colors.pink),
  //       ));

  //   return circle;
  // }
}
