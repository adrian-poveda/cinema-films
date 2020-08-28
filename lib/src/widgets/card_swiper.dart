import 'package:cinema_films/src/models/film.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  //Necesito recibir la lista de películas

  final List<Film> films;

  //Para que sea obligatorio el parámetro.
  CardSwiper({@required this.films});

  @override
  Widget build(BuildContext context) {
    //Tamaño dependiendo del tamaño del dispositivo
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth:
            _screenSize.width * 0.7, //Para tener el 70% del ancho del móvil
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          films[index].uniqueId = '${films[index].id}-principal';
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'detail', arguments: films[index]);
            },
            child: Hero(
              tag: films[index].uniqueId,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/img/loading.gif'),
                    fit: BoxFit.cover,
                    image: NetworkImage(films[index].getPosterURL()),
                  )),
            ),
          );
        },
        itemCount: films.length,
        //pagination: new SwiperPagination(),
        //control: new SwiperControl()
      ),
    );
  }
}
