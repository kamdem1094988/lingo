import 'package:flutter/material.dart';
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

  // const TopicProgress({Key? key, required this.topic}) : super(key: key);
  const TopicProgress({Key? key}) : super(key: key);

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
    return const Padding(
      padding: EdgeInsets.only(left: 8),
      child: Text(
        // '${report.topics[topic.id]?.length ?? 0} / ${topic.quizzes.length}',
        '4 / 2',
        style: TextStyle(fontSize: 10, color: Colors.grey),
      ),
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