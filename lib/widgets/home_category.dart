import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HomeCategory extends StatefulWidget {
  final String category;
  final String description;
  HomeCategory(this.category,this.description);
  @override
  _HomeCategoryState createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      height: 190.0,
      child: Card(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Text(widget.category),
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
