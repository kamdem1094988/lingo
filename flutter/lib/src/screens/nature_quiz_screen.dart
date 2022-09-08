import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingo/src/shared/widget/nature_quiz/nature_body.dart';

import '../controller/nature_question_controller.dart';



class NatureQuizScreen extends StatelessWidget {
  const NatureQuizScreen({Key? key}) : super(key: key);

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
      body: const NatureBody(),
    );
  }
}
