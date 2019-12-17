import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = Provider.of<ValueNotifier<int>>(context);
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      child: CarouselSlider(
        height: 400.0,
        initialPage: 0,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        pauseAutoPlayOnTouch: Duration(seconds: 5),
        items: [1, 2, 3].map((i) {
          return Builder(
            builder: (BuildContext context) {
              Color color;
              switch (selected.value) {
                case 0:
                  color = Colors.green[500];
                  break;
                case 1:
                  color = Colors.amber;
                  break;
                case 2:
                  color = Colors.red;
                  break;
                default:
                  color = Colors.blue;
                  break;
              }
              return Column(
                
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: color,
                      ),
                      child: Image.network(
                        'https://picsum.photos/250?image=9',
                      )),
                  Container(child: Text('Event: ${i}')),
                ],
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
