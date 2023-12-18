import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_project_for_kirn_tech/custom_painter_model.dart';
import 'package:test_project_for_kirn_tech/title_component_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> animationFirstLine;
  late final Animation<double> animationSecondLine;
  late final Animation<double> animationThirdyLine;
  late List<double> listPercent;

  late double currentFirstPercent;
  late double currentSecondPercent;
  late double currentThirdPercent;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    listPercent = _generateRandomNumbers();
    currentFirstPercent = listPercent[0];
    currentSecondPercent = listPercent[1];
    currentThirdPercent = listPercent[2];

    animationFirstLine =
        createPercentageAnimation(_controller, currentFirstPercent);
    animationSecondLine =
        createPercentageAnimation(_controller, currentSecondPercent);
    animationThirdyLine =
        createPercentageAnimation(_controller, currentThirdPercent);

    super.initState();
  }

  Animation<double> createPercentageAnimation(
    AnimationController controller,
    double percent,
  ) {
    return Tween(begin: 0.0, end: percent / 100).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
      ),
    );
  }

  List<double> _generateRandomNumbers() {
    final Random random = Random();
    double number1 = random.nextDouble() * 100;
    double remainingSum = 100 - number1;
    double number2 = random.nextDouble() * remainingSum;
    double number3 = remainingSum - number2;
    return [number1, number2, number3];
  }

  @override
  Widget build(BuildContext context) {
    final double verticalPadding = MediaQuery.of(context).size.width / 20;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            currentFirstPercent = listPercent[0];
            currentSecondPercent = listPercent[1];
            currentThirdPercent = listPercent[2];

            listPercent = _generateRandomNumbers();
            _controller.forward(from: 0.0);
          });
        },
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: verticalPadding),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff282735),
                  borderRadius: BorderRadius.circular(30),
                ),
                width: MediaQuery.of(context).size.width - verticalPadding * 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListTile(
                    title: TitleComponent(
                      percent: listPercent,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(25),
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (BuildContext context, Widget? child) {
                          return CustomPaint(
                            painter: Chart(
                              firstPercent: currentFirstPercent *
                                      (1 - _controller.value) +
                                  listPercent[0] * _controller.value,
                              secondPercent: currentSecondPercent *
                                      (1 - _controller.value) +
                                  listPercent[1] * _controller.value,
                              thirdPercent: currentThirdPercent *
                                      (1 - _controller.value) +
                                  listPercent[2] * _controller.value,
                            ),
                          );
                        },
                      ),
                    ),
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
