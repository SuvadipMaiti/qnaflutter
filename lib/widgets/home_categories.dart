import 'package:flutter/material.dart';
import 'package:qna/models/category.dart';
import 'package:qna/widgets/home_category.dart';

class HomeCategories extends StatefulWidget {
  final List<Category> categoryList;
  HomeCategories({this.categoryList});
  @override
  _HomeCategoriesState createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.categoryList.length,
        itemBuilder: (context, index){
          return HomeCategory(this.widget.categoryList[index].category,this.widget.categoryList[index].description);
        },
      ),
    );
  }
}
