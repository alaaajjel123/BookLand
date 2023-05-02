import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Trending1Book extends StatelessWidget {
  Trending1Book({Key? key}) : super(key: key);

  final trendings = [
    'assets/images/book3.jpg',
    'assets/images/book8.jpg',
    'assets/images/book4.jpg',
    'assets/images/book2.jpg',
    'assets/images/book3.jpg',
    'assets/images/upcoming3.jpg',
    'assets/images/upcoming3.jpg',
  ];

  final _pageController1 = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      height: 120,
      child: Stack(
        children: [
          PageView(
            controller: _pageController1,
            children: trendings
                .map((e) => Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              e,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.black,
                                    Colors.black45,
                                    Colors.black12,
                                    Colors.black.withOpacity(0)
                                  ])),
                        ),
                        const Positioned(
                            left: 30,
                            top: 20,
                            child: Text(
                              'trending Book',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            )),
                        const Positioned(
                            left: 30,
                            top: 55,
                            child: Text(
                              '30+ trending books coming with various \ngames are waiting for you',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ))
                      ],
                    ))
                .toList(),
          ),
          Positioned(
              left: 30,
              bottom: 10,
              child: SmoothPageIndicator(
                controller: _pageController1,
                count: trendings.length,
                effect: const ExpandingDotsEffect(
                  expansionFactor: 4,
                  dotWidth: 8,
                  dotHeight: 4,
                  activeDotColor: Colors.white,
                ),
                onDotClicked: (index) {
                  _pageController1.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut);
                },
              ))
        ],
      ),
    );
  }
}
