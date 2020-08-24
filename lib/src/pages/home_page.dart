import 'package:cinema_films/src/models/film.dart';
import 'package:cinema_films/src/providers/films_provider.dart';
import 'package:cinema_films/src/widgets/card_swiper.dart';
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
      body: SafeArea( // Sirve para colocar las cosas fuera del notch que la mayoría de móviles tienen ahora
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _filmSwiper(),
              _footer(context)
            ],
          ),
        )
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
            height: 400,
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
        children: [
          Text('Popular films', style: Theme.of(context).textTheme.subhead),
          FutureBuilder(
            future: filmsProvider.getPopularFilms(),
            builder: (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {

            if (snapshot.hasData){
              snapshot.data?.forEach( (film) => print (film.title));
              return Container();
              
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