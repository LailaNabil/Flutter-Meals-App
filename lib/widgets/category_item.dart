import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({this.id, this.title, this.color});

  void _selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   return CategoryMealsScreen(categoryId: id,categoryTitle: title,);
    // }));
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          title,
          // title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            // gradient: LinearGradient(colors: [color, color.withOpacity(0.5)]),
            color: color,
            borderRadius: BorderRadius.circular(12.0)),
      ),
    );
  }
}
