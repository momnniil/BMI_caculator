import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatefulWidget {
  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  Color kInactiveCardColor = const Color(0xFF0A0E21);
  Color kActiveCardColor = const Color(0xFF1D1E33);
  String selectedGender = '';
  double height = 160;
  int age = 18;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("BMICalculator",
                style: TextStyle(fontSize: 40, color: (Colors.cyan))),
          ),
          body: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = 'male';
                          });
                        },
                        child: Container(
                          color: selectedGender == 'male'
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          child: const Column(
                            children: [
                              Expanded(
                                child: Icon(
                                  FontAwesomeIcons.hammer,
                                  size: 80,
                                ),
                              ),
                              Text('male', style: TextStyle(fontSize: 35)),
                            ],
                          ),

                          // child: Icon(Icons.female),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          selectedGender = 'female';
                          setState(() {});
                        },
                        child: Container(
                          color: selectedGender == 'female'
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          child: const Column(
                            children: [
                              Expanded(
                                child: Icon(
                                  FontAwesomeIcons.seedling,
                                  size: 80,
                                ),
                              ),
                              Text('female', style: TextStyle(fontSize: 35)),
                            ],
                          ),
                          // child: Icon(Icons.male),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: kInactiveCardColor,
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'height:${height.round()} cm',
                        style: const TextStyle(fontSize: 35),
                      ),
                      Slider(
                        max: 200,
                        min: 100,
                        value: height,
                        onChanged: (value) {
                          height = value;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: kInactiveCardColor,
                        width: 200,
                        child: Column(
                          children: [
                            const Text(
                              'Age',
                              style: TextStyle(fontSize: 35),
                            ),
                            Text(
                              '$age',
                              style: const TextStyle(fontSize: 35),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        age++;
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.plus_one,
                                        size: 50,
                                      )),
                                ),
                                Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        age--;
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.exposure_minus_1,
                                        size: 50,
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: kInactiveCardColor,
                        child: Column(
                          children: [
                            Text(
                              'weight',
                              style: TextStyle(fontSize: 35),
                            ),
                            Text(
                              '$weight',
                              style: TextStyle(fontSize: 35),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: IconButton(
                                  onPressed: () {
                                    weight++;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.plus_one,
                                    size: 50,
                                  ),
                                )),
                                Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        weight--;
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.exposure_minus_1,
                                        size: 50,
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                color: kInactiveCardColor,
                child: GestureDetector(
                  onTap: () {
                    print(widget);
                    print(height);
                    print(age);
                    print("BMI:${weight / ((height / 100) * (height / 100))} ");
                  },
                  child: Text(
                    'caculate',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
