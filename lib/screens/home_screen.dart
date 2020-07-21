import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qna/models/category.dart';
import 'package:qna/models/question.dart';
import 'package:qna/services/latest_questions_service.dart';
import 'package:qna/services/slider_service.dart';
import 'package:qna/services/category_service.dart';
import 'package:qna/widgets/carousel_slider.dart';
import 'package:qna/widgets/home_categories.dart';
import 'package:qna/widgets/latest_questions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SliderService _sliderService = SliderService();
  CategoryService _categoryService = CategoryService();
  LatestQuestionsService _latestQuestionsService = LatestQuestionsService();

  var items = [];
  List<Category> _categoryList = List<Category>();
  List<Question> _latestQuestionsList = List<Question>();

  @override
  void initState() {
    super.initState();
    _getAllSliders();
    _getAllCategories();
    _getAllLatestQuestions();
  }

  _getAllLatestQuestions() async {
    var latestQuestions = await _latestQuestionsService.getLatestQuestions();
    var result = json.decode(latestQuestions.body);
    result['latest_questions'].forEach((latestQuestion) {
      var model = Question();
      model.id = latestQuestion['id'];
      model.slug = latestQuestion['slug'];
      model.question = latestQuestion['question'];
      if(latestQuestion['description'] != null) {
        model.description = latestQuestion['description'];
      }else{
        model.description = "";
      }
      model.status = latestQuestion['status'];

      setState(() {
        _latestQuestionsList.add(model);
      });
    });
  }

  _getAllCategories() async {
    var categories = await _categoryService.getCategories();
    var result = json.decode(categories.body);
    result['categories'].forEach((category) {
      var model = Category();
      model.id = category['id'];
      model.slug = category['slug'];
      model.category = category['category'];
      model.description = category['description'];
      model.status = category['status'];

      setState(() {
        _categoryList.add(model);
      });
    });
  }

  _getAllSliders() async {
    var sliders = await _sliderService.getSliders();
    var result = json.decode(sliders.body);
    result['sliders'].forEach((slider) {
      setState(() {
        items.add(NetworkImage(slider['image']));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qna App'),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            carouselSlider(items),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Question Categories',
                    style: TextStyle(fontSize: 30.0),
                  ),
                )),
            HomeCategories(
              categoryList: _categoryList,
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Latest Questions',
                    style: TextStyle(fontSize: 30.0),
                  ),
                )),
            LatestQuestions(
              latestQuestionList: _latestQuestionsList,
            ),
          ],
        ),
      ),
    );
  }
}
