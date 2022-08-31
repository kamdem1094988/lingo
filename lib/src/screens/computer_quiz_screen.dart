import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/computer_question_controller.dart';
import '../shared/widget/computer_quiz/computer_body.dart';



class ComputerQuizScreen extends StatelessWidget {
  const ComputerQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ComputerQuestionController controller = Get.put(ComputerQuestionController());
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
      body: const ComputerBody(),
    );
  }
}
