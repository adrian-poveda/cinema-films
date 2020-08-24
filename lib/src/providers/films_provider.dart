
import 'package:cinema_films/src/models/film.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FilmsProvider {

  String _apiKey    = 'e55890ec1b25473323b10b77aaac2298';
  String _url       = 'api.themoviedb.org';
  String _language  = 'en-US';

  Future<List<Film>> _processResponse(Uri url) async {

    //Hacer petición http
    final resp = await http.get(url);
    final decoded = json.decode(resp.body);

    final films = new Films.fromJsonList(decoded['results']);

    return films.items;


  }

  Future<List<Film>> getNowPlayingFilms() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language': _language
    });

    //Hacer petición http
    return _processResponse(url);

  }


  Future<List<Film>> getPopularFilms() async {
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key' : _apiKey,
      'language': _language
    });

    //Hacer petición http
    return _processResponse(url);


  }
}