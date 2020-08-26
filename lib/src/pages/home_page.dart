import 'package:cinema_films/src/models/film.dart';
import 'package:cinema_films/src/providers/films_provider.dart';
import 'package:cinema_films/src/widgets/card_swiper.dart';
import 'package:cinema_films/src/widgets/popular_movie.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  final filmsProvider = new FilmsProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Movies playing now'),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body:Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _filmSwiper(),
                _footer(context)
              ],
            ),
          ) 
    );
  }

  _filmSwiper() {

    return FutureBuilder(
      future: filmsProvider.getNowPlayingFilms(),
      builder: (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {

        if (snapshot.hasData){
          return CardSwiper(
                films: snapshot.data,
                );
        }else{
          return Container(
            height: 300,
            child: Center(
              child: CircularProgressIndicator()
              )
              );
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
            padding: EdgeInsets.only(left:20),
            child: Text('Popular films', style: Theme.of(context).textTheme.subtitle1)),
          SizedBox(height: 30),
          FutureBuilder(
            future: filmsProvider.getPopularFilms(),
            builder: (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {

            if (snapshot.hasData){
              return PopularFilm(films: snapshot.data);
              
        }else{
          return Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator()
              )
              );
        }
        
      },
    )
        ],
      )
    );
  }


   
}