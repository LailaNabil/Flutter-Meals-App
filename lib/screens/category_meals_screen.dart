import 'package:flutter/material.dart';
import 'package:the_meals_app/models/meal.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categories-meals';
  // final String categoryId;
  // final String categoryTitle;
  //
  // const CategoryMealsScreen({ this.categoryId, this.categoryTitle});
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String ,String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    List categoryMeals = [];
    DUMMY_MEALS.forEach((element) {
      if (element.categories.contains(categoryId)) {
        categoryMeals.add(element);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index){
        print(categoryMeals[index].title);
        return MealItem(currentMeal: categoryMeals[index],);
      },
      itemCount: categoryMeals.length,
      ),
    );
  }
}
