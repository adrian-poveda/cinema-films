
import 'dart:async';

import 'package:cinema_films/src/models/film.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FilmsProvider {

  String _apiKey      = 'e55890ec1b25473323b10b77aaac2298';
  String _url         = 'api.themoviedb.org';
  String _language    = 'en-US';

  int _popularesPage  = 0;

  List<Film> _populars  = new List();

  //Stream de datos //Broadcast para que se pueda escuchar en muchos lugares esos streams
  final _popularStreamController = StreamController<List<Film>>.broadcast();

  //Insertar info al stream
  Function(List<Film>) get popularsSink   => _popularStreamController.sink.add;

  //Escuchar datos
  Stream<List<Film>> get popularsStream => _popularStreamController.stream;

  void disposeStreams(){
    _popularStreamController?.close();
  }

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
    return await _processResponse(url);

  }


  Future<List<Film>> getPopularFilms() async {

    _popularesPage++;
    
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key' : _apiKey,
      'language': _language,
      'page'    : _popularesPage.toString()
    });

    //Hacer petición http
    final resp = await _processResponse(url);
    _populars.addAll(resp);
    //Añadiendo información al stream mediante el Sink
    popularsSink( _populars );

    return resp;


  }
}