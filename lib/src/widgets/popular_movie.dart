import 'package:cinema_films/src/models/film.dart';
import 'package:flutter/material.dart';

class PopularFilm extends StatelessWidget {
  final List<Film> films;

  final Function nextPage;

  PopularFilm({@required this.films, @required this.nextPage});

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );



  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
        nextPage();
      }
    });


    return Container(
      height: _screenSize.height * 0.2,
      child: PageView.builder(//Renderiza los elementos de forma simulatánea // Builder = solo cuando sean necesarios
        itemCount: films.length,
        pageSnapping: false,
        controller: _pageController,
        itemBuilder: ( context, i) {
          return _createCard(context, films[i]);
        },
        //children: _cards(context),
      ), 
    );
  }

Widget _createCard(BuildContext context, Film film){

  return Container(
        margin: EdgeInsets.only(right: 15),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                image: NetworkImage( film.getPosterURL() ),
                placeholder: AssetImage('assets/img/loading.gif'),
                fit: BoxFit.cover,
                height: 160,
              ),
            ),
            SizedBox(height: 5),
            Text(film.title, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.caption)
          ],
        ),
      );
}

  List<Widget> _cards(BuildContext context) {


    return films.map((film){

      return Container(
        margin: EdgeInsets.only(right: 15),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                image: NetworkImage( film.getPosterURL() ),
                placeholder: AssetImage('assets/img/loading.gif'),
                fit: BoxFit.cover,
                height: 160,
              ),
            ),
            SizedBox(height: 5),
            Text(film.title, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.caption)
          ],
        ),
      );

    }).toList();
}
}
