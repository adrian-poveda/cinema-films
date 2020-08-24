import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  //Necesito recibir la lista de películas

  final List<dynamic> films;

  //Para que sea obligatorio el parámetro.
  CardSwiper({ @required this.films});

  @override
  Widget build(BuildContext context) {

    //Tamaño dependiendo del tamaño del dispositivo
    final _screenSize = MediaQuery.of(context).size;


    return Container(
      padding: EdgeInsets.only(top:10),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7, //Para tener el 70% del ancho del móvil
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index){
          //return Image.network('https://images-na.ssl-images-amazon.com/images/I/71+PKDjuooL.jpg', fit: BoxFit.fill,);
          return ClipRRect(
            borderRadius: BorderRadius.circular(17),
            child:
                Image.network('https://images-na.ssl-images-amazon.com/images/I/71+PKDjuooL.jpg', 
                                fit: BoxFit.cover,),
          );
        },
        itemCount: films.length,
        //pagination: new SwiperPagination(),
        //control: new SwiperControl()

      ),
    );
  }
}