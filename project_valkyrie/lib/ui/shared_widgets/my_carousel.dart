import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:project_valkyrie/ui/styles/text_styles.dart';
import 'package:project_valkyrie/ui/styles/ui_helper.dart';

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      child: CarouselSlider(
        viewportFraction: 0.9,
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
              return Column(
                children: <Widget>[
                  Card(
                    //color: Colors.blueGrey[200],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(UIHelper.circularAngle)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(UIHelper.circularAngle),
                        boxShadow:[UIHelper.customBoxShadow],
                      ),
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(UIHelper.circularAngle),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: 'https://picsum.photos/300?image=${i + 99}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  UIHelper.verticalSpaceLarge,
                  Container(
                    child: Text(
                      'Event: $i',
                      style:
                          TextStyles.subHeaderStyle(),
                    ),
                  ),
                ],
              );
            },
          );
        }).toList(),
      ),
    );
  }
}