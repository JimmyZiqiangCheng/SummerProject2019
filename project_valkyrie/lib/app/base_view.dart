import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BaseView extends StatelessWidget {
  // final _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    print('---------rebuilding-------------');
    final selected = Provider.of<ValueNotifier<int>>(context);

    String pageTitle;
    switch (selected.value) {
                  case 0:
                    pageTitle = 'Home';
                    break;
                  case 1:
                    pageTitle = 'Parcel'; 
                    break;
                  case 2:
                    pageTitle = 'Calendar';
                    break;
                  default:
                    pageTitle = pageTitle;
                    break;
                }
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 50.0),
        child: CarouselSlider(
          height: 200.0,
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
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: color,
                    ),
                    child: Text(
                      'text ${selected.value}',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.markunread,
            ),
            title: Text('Parcel'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
            ),
            title: Text('Calender'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            title: Text('more'),
          ),
        ],
        currentIndex: selected.value,
        selectedItemColor: Colors.green[800],
        selectedIconTheme:
            IconThemeData(color: Colors.green[800], opacity: 1.0, size: 25.0),
        unselectedItemColor: Colors.grey,
        unselectedIconTheme:
            IconThemeData(color: Colors.grey, opacity: 1.0, size: 25.0),
        onTap: (_index) => _index != 3 ? selected.value = _index : null,
      ),
    );
  }
}
