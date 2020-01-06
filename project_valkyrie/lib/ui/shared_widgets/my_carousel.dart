import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:project_valkyrie/ui/styles/text_styles.dart';
import 'package:project_valkyrie/ui/styles/ui_helper.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  double _carouselHeight = 400.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      child: Stack(
        children: <Widget>[
          CarouselSlider(
              viewportFraction: 0.9,
              height: _carouselHeight,
              initialPage: 0,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              pauseAutoPlayOnTouch: Duration(seconds: 5),
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: _carouselItemList
            ),
          Positioned(
            top: _carouselHeight - 70.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [0,1,2].map((i) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == i ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4)
                  ),
                );
              }).toList(),
            )
          )
        ],
      ),
    );
  }

  List _carouselItemList = [0, 1, 2].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Card(
              //color: Colors.blueGrey[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(UIHelper.circularAngle)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(UIHelper.circularAngle),
                  boxShadow: [UIHelper.customBoxShadow],
                ),
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius:
                      new BorderRadius.circular(UIHelper.circularAngle),
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
                style: TextStyles.subHeaderStyle(),
              ),
            ),
          ],
        );
      },
    );
  }).toList();
}
