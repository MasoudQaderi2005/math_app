import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double velocityValue = 0;
  double accelerationValue = 0;
  double ballX = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const duration = Duration(milliseconds: 10);
    Timer.periodic(duration, (timer) {
      setState(() {
        ballX += velocityValue / 400;
        if (ballX > 1.3) {
          ballX = -1.3;
        } else if (ballX < -1.3) {
          ballX = 1.3;
        }
        velocityValue += accelerationValue / 100;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        color: Colors.grey[700],
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'M O T I O N  A P P',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[200],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text('♥'),
                        ),
                        Text('C  R  E  A  T  E  D  B  Y  K  O  K  O'),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment(ballX, 0),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'v = ${velocityValue.round()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Slider(
                            min: 0,
                            max: 8,
                            activeColor: Colors.grey[500],
                            inactiveColor: Colors.grey[400],
                            value: velocityValue.clamp(0, 8),
                            onChanged: (newValue) {
                              setState(() {
                                velocityValue = newValue;
                              });
                            },
                          ),
                          Text(
                            'V E L O C I T Y',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'a = ${accelerationValue.round()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Slider(
                            min: -1,
                            max: 1,
                            activeColor: Colors.deepPurple[300],
                            inactiveColor: Colors.deepPurple[200],
                            value: accelerationValue,
                            onChanged: (newValue) {
                              setState(() {
                                accelerationValue = newValue;
                              });
                            },
                          ),
                           Text(
                            'A C C E L E R A T I O N',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 20,
                            ),
                          ),
                        ],
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