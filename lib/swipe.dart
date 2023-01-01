// ignore_for_file: unnecessary_const

import 'package:design/home_page.dart';
import 'package:design/intro_screens/intro_page_1.dart';
import 'package:design/intro_screens/intro_page_2.dart';
import 'package:design/intro_screens/intro_page_3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Swipe extends StatefulWidget {
  const Swipe({Key? key}) : super(key: key);

  @override
  State<Swipe> createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> {
  final PageController _controller = PageController();
//track if we are on the last page
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(
                () {
                  onLastPage = (index == 2);
                },
              );
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

          //dot indicators
          Container(
            // ignore: prefer_const_constructors
            alignment: Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (() {
                    _controller.jumpToPage(2);
                  }),
                  child: const Text(
                    'Skip',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 23, 50, 255),
                    ),
                  ),
                ),
                SmoothPageIndicator(controller: _controller, count: 3),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const HomePage();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Done',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 23, 50, 255),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: const Text(
                          'Next',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 23, 50, 255),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
