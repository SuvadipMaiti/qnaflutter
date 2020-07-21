import 'package:flutter/material.dart';
import 'package:qna/models/question.dart';
import 'package:qna/widgets/latest_question.dart';

class LatestQuestions extends StatefulWidget {
  final List<Question> latestQuestionList;
  LatestQuestions({this.latestQuestionList});
  @override
  _LatestQuestionsState createState() => _LatestQuestionsState();
}

class _LatestQuestionsState extends State<LatestQuestions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.latestQuestionList.length,
        itemBuilder: (context, index){
          return LatestQuestion(this.widget.latestQuestionList[index].question,this.widget.latestQuestionList[index].description);
        },
      ),
    );
  }
}
