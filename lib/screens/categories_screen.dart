import 'package:flutter/material.dart';
import 'package:the_meals_app/models/category.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(
          children: DUMMY_CATEGORIES
              .map((category) => CategoryItem(
                    id: category.id,
                    title: category.title,
                    color: category.color,
                  ))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2),
        ),
      ),
    );
  }
}
