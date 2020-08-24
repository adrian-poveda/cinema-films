import 'package:cinema_films/src/widgets/card_swiper.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Most recient films'),
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
            children: [
              _filmSwiper()
            ],
          ),
        )
      ) 
      
      
    );
  }

  _filmSwiper() {

    return CardSwiper(
      films: [1,2,3,4,5],
    );
    
  }


   
}