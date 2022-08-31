import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingo/src/controller/nature_question_controller.dart';
import 'package:lingo/src/controller/sport_question_controller.dart';
import 'package:lingo/src/controller/travel_question_controller.dart';

import '../../controller/computer_question_controller.dart';
// import 'package:provider/provider.dart';
// import 'package:quizzapp/services/models.dart';

class AnimatedProgressbar extends StatelessWidget {
  final double value;
  final double height;

  const AnimatedProgressbar(
      {Key? key, required this.value, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, box) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: box.maxWidth,
          child: Stack(
            children: [
              Container(
                height: height,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(height),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutCubic,
                height: height,
                width: box.maxWidth * _floor(value),
                decoration: BoxDecoration(
                  color: _colorGen(value),
                  borderRadius: BorderRadius.all(
                    Radius.circular(height),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Always round negative or NaNs to min value
  _floor(double value, [min = 0]) {
    return value.sign <= min ? min : value;
  }

  ///
  _colorGen(double value) {
    int rgb = (value * 255).toInt();
    return Colors.deepOrange.withGreen(rgb).withRed(255 - rgb);
  }
}

class TopicProgress extends StatelessWidget {
  // final Topic topic;
  final String spec;

  // const TopicProgress({Key? key, required this.topic}) : super(key: key);
  const TopicProgress({required this.spec});

  @override
  Widget build(BuildContext context) {
    // Report report = Provider.of<Report>(context);
    return Row(
      children: [
        // _progressCount(report, topic),
        _progressCount(),
        Expanded(
          child: AnimatedProgressbar(
            // value: _calculateProgress(topic, report),
            value: _calculateProgress(),
            height: 8,
          ),
        ),
      ],
    );
  }

  // Widget _progressCount(Report report, Topic topic) {
  Widget _progressCount() {
    ComputerQuestionController computerQuestionController = Get.put(ComputerQuestionController());
    NatureQuestionController natureQuestionController = Get.put(NatureQuestionController());
    SportQuestionController sportQuestionController = Get.put(SportQuestionController());
    TravelQuestionController travelQuestionController = Get.put(TravelQuestionController());

    Text text = const Text('');

    if (spec=='travel'){
      text = Text(
        '${travelQuestionController.questionNumber.value} / ${travelQuestionController.questions.length}',
        style: const TextStyle(fontSize: 10, color: Colors.grey),
      );
    }else if(spec=='sport'){
      text = Text(
        '${sportQuestionController.questionNumber.value} / ${sportQuestionController.questions.length}',
        style: const TextStyle(fontSize: 10, color: Colors.grey),
      );
    }else if(spec=='nature'){
      text = Text(
        '${natureQuestionController.questionNumber.value} / ${natureQuestionController.questions.length}',
        style: const TextStyle(fontSize: 10, color: Colors.grey),
      );
    }else if(spec=='computer'){
      text = Text(
        '${computerQuestionController.questionNumber.value} / ${computerQuestionController.questions.length}',
        style: const TextStyle(fontSize: 10, color: Colors.grey),
      );
    }


    // questionController.questionNumber.value
    // questionController.questionNumber.length
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: text,
    );
  }

  // double _calculateProgress(Topic topic, Report report) {
  double _calculateProgress() {
    try {
      // int totalQuizzes = topic.quizzes.length;
      int totalQuizzes = 10;
      // int completedQuizzes = report.topics[topic.id].length;
      int completedQuizzes = 4;
      return completedQuizzes / totalQuizzes;
    } catch (e) {
      return 0;
    }
  }
}