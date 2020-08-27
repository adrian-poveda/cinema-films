import 'package:cinema_films/src/models/film.dart';
import 'package:cinema_films/src/providers/films_provider.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {

@override
ThemeData appBarTheme(BuildContext context) {
    return new ThemeData(
      primaryColor: Color.fromRGBO(21, 32, 44, 1),
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        color: Color.fromRGBO(21, 32, 44, 1)
        )
    );
}

  final filmsProvider = new FilmsProvider();

  final exampleFilms = ['Spiderman', 'Hulk', 'Vengadores 3', 'Ironman 4', 'Flash 5'];

  final exampleRecentFilms = ['Spiderman', 'Hulk', 'Adios'];

  String _selectedFilm = '';


  @override
  List<Widget> buildActions(BuildContext context) {
      //Acciones de nuestro AppBar (por ejemplo boton de limpiar texto)
      return [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            query = '';
            
          },
        )

      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Algo que aparece al inicio , como por ejemplo icono de volver atrás
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, null);
        },
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // Intrucción que crea los resultados que vamos a mostrar
      return Center(
        child: Container(
          height: 50,
          width: 50,
          color: Colors.indigo,
          child: Text(_selectedFilm),

        ),
      );
    }

    @override
    Widget buildSuggestions(BuildContext context) {
    // Sugerencias que aparecen en el buscador cuando la persona escribe

    if ( query.isEmpty ){
      return Container();
    } else {
      return FutureBuilder(
      future: filmsProvider.searchFilm(query),
      builder: (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {

          if( snapshot.hasData ) {
            
            final films = snapshot.data;

            return ListView(
              children: films.map( (film) {
                  return ListTile(
                    leading: FadeInImage(
                      image: NetworkImage( film.getPosterURL() ),
                      placeholder: AssetImage('assets/img/no-image.jpg'),
                      width: 50.0,
                      fit: BoxFit.contain,
                    ),
                    title: Text( film.title ),
                    subtitle: Text( film.originalTitle ),
                    onTap: (){
                      close( context, null);
                      film.uniqueId = '';
                      Navigator.pushNamed(context, 'detail', arguments: film);
                    },
                  );
              }).toList()
            );

          } else {
            return Center(
              child: CircularProgressIndicator()
            );
          }

      },
    );
    }
  }
  
  //   @override
  //   Widget buildSuggestions(BuildContext context) {
  //   // Sugerencias que aparecen en el buscador cuando la persona escribe

  //   final suggestions = ( query.isEmpty ) 
  //                         ? exampleRecentFilms 
  //                         : exampleFilms.where((film) => film.toLowerCase().startsWith(query.toLowerCase())
  //                         ).toList();


  //   return ListView.builder(
  //     itemCount: suggestions.length,
  //     itemBuilder: ( context, i)  {
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(suggestions[i]),
  //         onTap: (){
  //           _selectedFilm = suggestions[i];
  //           showResults(context);
  //         },
  //       );
  //     }
  //   );
  // }



}