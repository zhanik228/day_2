import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _oAnimationSlide;
  late Animation<Offset> _nAnimationSlide;
  late Animation<Offset> _slideDownAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _fadeYAnimation;
  late Animation<double> _fadeOAnimation;
  late Animation<double> _fadeNAnimation;
  late Animation<double> _fadeTopAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _slideAnimation = Tween<Offset>(begin: Offset(2.4, 0.5), end: Offset(2.4, 0.3))
    .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _slideAnimation = Tween<Offset>(
      begin: Offset(2.4, 0.5),
      end: Offset(2.4, 0.3),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.25, curve: Curves.easeInOut),
      ),
    );

    _slideDownAnimation = Tween<Offset>(
      begin: Offset(3.7, 0.3),
      end: Offset(3.7, 0.5),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.25, 0.5, curve: Curves.easeInOut),
      ),
    );

    _oAnimationSlide = Tween<Offset>(
      begin: Offset(5.8, 1),
      end: Offset(5.8, 0.8),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 0.75, curve: Curves.easeInOut),
      ),
    );

    _nAnimationSlide = Tween<Offset>(
      begin: Offset(5.8, 0.3),
      end: Offset(5.8, 0.5),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.75, 1.0, curve: Curves.easeInOut),
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _fadeYAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.25, 0.5, curve: Curves.easeIn),
      ),
    );

    _fadeOAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 0.75, curve: Curves.easeIn),
      ),
    );

    _fadeNAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.75, 0.95, curve: Curves.easeIn),
      ),
    );

    _fadeTopAnimation = Tween<double>(
      begin: 0,
      end: 1
    ).animate(
      CurvedAnimation(
        parent: _controller, 
        curve: Interval(0.95, 0.96)
      )
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1)
    .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var currAngle = -95.0;
    var stickColor = Colors.redAccent;
    
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
FadeTransition(
                opacity: _fadeTopAnimation,
                child: Positioned(
                  left: 100,
                  top: 200,
                  child: Transform.rotate(
                    angle: currAngle,
                    child: Container(
                      width: 120,
                      height: 10,
                      color: stickColor,
                    ),
                  ),
                ),
              ),
                  ],
                ),
              ),
              Positioned(
                left: 50,
                top: 600,
                child: Transform.rotate(
                  angle: currAngle,
                  child: Container(
                    width: 120,
                    height: 10,
                    color: stickColor,
                  ),
                ),
              ),
              Positioned(
                left: 1000,
                top: 200,
                child: Transform.rotate(
                  angle: currAngle,
                  child: Container(
                    width: 120,
                    height: 10,
                    color: stickColor,
                  ),
                ),
              ),
              Positioned(
                left: 700,
                top: 600,
                child: Transform.rotate(
                  angle: currAngle,
                  child: Container(
                    width: 120,
                    height: 10,
                    color: stickColor,
                  ),
                ),
              ),
              BackdropFilter(
                filter:ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Positioned(
                            top: 100,
                            left: 200,
                            child: Text(
                              'L',
                              style: TextStyle(
                                fontSize: 300,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: _fadeYAnimation,
                        child: SlideTransition(
                          position: _slideDownAnimation,
                          child: Positioned(
                            top: 200,
                            left: 400,
                            child: Text(
                              'Y',
                              style: TextStyle(
                                fontSize: 300,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   top: 100,
                      //   left: 600,
                      //   child: Text(
                      //     'O',
                      //     style: TextStyle(
                      //       fontSize: 300,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                      FadeTransition(
                        opacity: _fadeOAnimation,
                        child: SlideTransition(
                          position: _oAnimationSlide,
                          child: Positioned(
                            top: 160,
                            left: 610,
                            child: Container(
                              // color: Colors.black,
                              height: 220,
                              width: 110,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                              width: 110,
                              height: 220,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  'assets/media-files/images/Basilique.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Container(
                                width: 60,
                                height: 180,
                                color: Colors.deepPurple,
                                                  ),
                            )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   left: 633,
                      //   top: 180,
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(40),
                      //     child: Container(
                      //       width: 60,
                      //       height: 180,
                      //       color: Colors.deepPurple,
                      //                         ),
                      //   )),
                      FadeTransition(
                        opacity: _fadeNAnimation,
                        child: SlideTransition(
                          position: _nAnimationSlide,
                          child: Positioned(
                            top: 200,
                            left: 800,
                            child: Text(
                              'N',
                              style: TextStyle(
                                fontSize: 300,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 110,
                        top: 200,
                        child: Transform.rotate(
                          angle: currAngle,
                          child: Container(
                            width: 120,
                            height: 10,
                            color: stickColor,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 190,
                        top: 500,
                        child: Transform.rotate(
                          angle: currAngle,
                          child: Container(
                            width: 120,
                            height: 10,
                            color: stickColor,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 430,
                        top: 450,
                        child: Transform.rotate(
                          angle: currAngle,
                          child: Container(
                            width: 120,
                            height: 10,
                            color: stickColor,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 780,
                        top: 180,
                        child: Transform.rotate(
                          angle: currAngle,
                          child: Container(
                            width: 120,
                            height: 10,
                            color: stickColor,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 900,
                        top: 500,
                        child: Transform.rotate(
                          angle: currAngle,
                          child: Container(
                            width: 120,
                            height: 10,
                            color: stickColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}