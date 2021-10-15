import 'package:flutter/material.dart';
import 'package:the_meals_app/models/meal.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meals';

  final List <Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  void _removeMeal(String mealId){
    print("remove");
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }
  String categoryTitle;
  List <Meal> displayedMeals = [];
  @override
  void didChangeDependencies() {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String ,String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    widget.availableMeals.forEach((element) {
      if (element.categories.contains(categoryId)) {
        displayedMeals.add(element);
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index){
        print(displayedMeals[index].title);
        return MealItem(currentMeal: displayedMeals[index],
        removeItem: _removeMeal,
        );
      },
      itemCount: displayedMeals.length,
      ),
    );
  }
}
