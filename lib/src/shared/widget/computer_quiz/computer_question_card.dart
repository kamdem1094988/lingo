import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingo/src/services/firebase_storage_methods.dart';
import 'package:lingo/src/shared/widget/video_player.dart';

import '../../../controller/computer_question_controller.dart';
import '../../../models/questions.dart';
import '../../constants/constants.dart';
import 'computer_option.dart';

class ComputerQuestionCard extends StatefulWidget {
  final Question question;

  const ComputerQuestionCard({Key? key, required this.question}) : super(key: key);

  @override
  State<ComputerQuestionCard> createState() => _ComputerQuestionCardState();
}

class _ComputerQuestionCardState extends State<ComputerQuestionCard> {
  @override
  Widget build(BuildContext context) {
    ComputerQuestionController controller = Get.put(ComputerQuestionController());
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Text(
              widget.question.question,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: kBlackColor),
            ),
            const SizedBox(
              height: 10,
            ),
            widget.question.type == 'image'
                ? Image.network(StorageMethods.getHttpsImageUrl(widget.question.media))
                : VideoApp(StorageMethods.getHttpsVideoUrl(widget.question.media)),
            const SizedBox(height: kDefaultPadding / 2),
            ...List.generate(
              widget.question.options.length,
              (index) => ComputerOption(
                index: index,
                text: widget.question.options[index],
                press: () => controller.checkAns(widget.question, index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
