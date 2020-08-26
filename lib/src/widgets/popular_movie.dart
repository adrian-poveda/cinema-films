import 'package:cinema_films/src/models/film.dart';
import 'package:flutter/material.dart';

class PopularFilm extends StatelessWidget {
  final List<Film> films;

  PopularFilm({@required this.films});



  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.2,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
        children: _cards(context),
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
