import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class LatestQuestion extends StatefulWidget {
  final String question;
  final String description;
  LatestQuestion(this.question,this.description);
  @override
  _LatestQuestionState createState() => _LatestQuestionState();
}

class _LatestQuestionState extends State<LatestQuestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      height: 190.0,
      child: Card(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Text(widget.question),
            ),
            Expanded(
              child: Html(
                data: widget.description,
              ),
            )
          ],
        ),
      ),
    );
  }
}
