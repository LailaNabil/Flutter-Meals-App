import 'package:flutter/material.dart';
import 'dummy_data.dart';
import '../screens/settings_screen.dart';

import '../screens/tabs_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/category_meals_screen.dart';
import '../screens/categories_screen.dart';
import 'models/meal.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map <String, bool> _filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false,
  };
  List <Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map <String, bool> filterData) {
    setState(() {
      _filters = filterData;
      
      _availableMeals = DUMMY_MEALS.where((element) =>
      element.isVegetarian == filterData['vegetarian']
      && element.isGlutenFree == filterData['gluten']
      && element.isVegan == filterData['vegan']
      && element.isLactoseFree == filterData['lactose']
      ).toList();
    });
    print(_filters);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData
              .light()
              .textTheme
              .copyWith(
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        SettingsScreen.routeName: (ctx) => SettingsScreen(saveFilters: _setFilters,currentFilters: _filters,),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
