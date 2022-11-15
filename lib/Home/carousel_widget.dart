import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;

  List cardList = [
    Container(
        width: 295,
        child: Column(children: [
          // for titles
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 10, top: 15, bottom: 10),
                  child: Column(children: [
                    Container(
                        child: const Text('Task Name',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))),
                    Container(
                        padding:
                            const EdgeInsets.only(left: 8, top: 8, bottom: 10),
                        child: const Text('Project Name',
                            style: TextStyle(color: Colors.grey, fontSize: 12)))
                  ])),
              Container(
                  padding: const EdgeInsets.only(left: 100),
                  child: IconButton(
                    icon: const Icon(Icons.more_horiz_rounded),
                    onPressed: () {},
                  ))
            ],
          ),
          //for progress title and perentage indicator
          Row(children: [
            Container(
                padding: const EdgeInsets.only(left: 15),
                child: const Text('Progress',
                    style: TextStyle(color: Colors.grey))),
            Container(
                padding: const EdgeInsets.only(left: 150),
                child: const Text('12%',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(61, 105, 19, 1),
                    ))),
          ]),
          // for progress bar
          Container(
              padding: const EdgeInsets.only(top: 8, bottom: 20, left: 8),
              child: LinearPercentIndicator(
                barRadius: const Radius.circular(8),
                width: 250.0,
                lineHeight: 10.0,
                percent: 0.2,
                progressColor: const Color.fromRGBO(61, 105, 19, 1),
              )),
          Container(
              padding: const EdgeInsets.only(left: 10),
              child: Row(children: [
                Container(child: const Icon(Icons.timer_outlined)),
                Container(
                    padding: const EdgeInsets.only(left: 8),
                    child: const Text('3 days left',
                        style: TextStyle(color: Colors.grey)))
              ]))
        ])),
    Container(
        child: Column(children: [
      // for titles
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 10, top: 15, bottom: 10),
              child: Column(children: [
                Container(
                    child: const Text('Task Name',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
                Container(
                    padding: const EdgeInsets.only(left: 8, top: 8, bottom: 10),
                    child: const Text('Project Name',
                        style: TextStyle(color: Colors.grey, fontSize: 12)))
              ])),
          Container(
              padding: const EdgeInsets.only(left: 100),
              child: IconButton(
                icon: const Icon(Icons.more_horiz_rounded),
                onPressed: () {},
              ))
        ],
      ),
      //for progress title and perentage indicator
      Row(children: [
        Container(
            padding: const EdgeInsets.only(left: 15),
            child:
                const Text('Progress', style: TextStyle(color: Colors.grey))),
        Container(
            padding: const EdgeInsets.only(left: 150),
            child: const Text('5%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(240, 177, 0, 1),
                ))),
      ]),
      // for progress bar
      Container(
          padding: const EdgeInsets.only(top: 8, bottom: 20, left: 8),
          child: LinearPercentIndicator(
            barRadius: const Radius.circular(8),
            width: 250.0,
            lineHeight: 10.0,
            percent: 0.2,
            progressColor: const Color.fromRGBO(240, 177, 0, 1),
          )),
      Container(
          padding: const EdgeInsets.only(left: 10),
          child: Row(children: [
            Container(child: const Icon(Icons.timer_outlined)),
            Container(
                padding: const EdgeInsets.only(left: 8),
                child: const Text('15 days left',
                    style: TextStyle(color: Colors.grey)))
          ]))
    ])),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        options: CarouselOptions(
          height: 180.0,

          autoPlay: false,
          // autoPlayInterval: const Duration(seconds: 3),
          // autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          aspectRatio: 2.0,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        items: cardList.map((card) {
          return Builder(builder: (BuildContext context) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: 600,
              child: Card(
                color: Colors.white,
                child: card,
              ),
            );
          });
        }).toList(),
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: map<Widget>(cardList, (index, url) {
      //     return Container(
      //       width: 10.0,
      //       height: 20.0,
      //       margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      //       decoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         color: _currentIndex == index
      //             ? const Color.fromRGBO(22, 123, 173, 1)
      //             : Colors.grey,
      //       ),
      //     );
      //   }),
      // ),
    ]);
  }
}
