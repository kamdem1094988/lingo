import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/nature_question_controller.dart';
import '../shared/widget/sport_quiz/sport_body.dart';

class SportQuizScreen extends StatelessWidget {
  const SportQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NatureQuestionController controller = Get.put(NatureQuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Flutter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: controller.nextQuestion, child: const Text("Skip")),
        ],
      ),
      body: const SportBody(),
    );
  }
}
