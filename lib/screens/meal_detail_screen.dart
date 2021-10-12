import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    var currentMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == routeArgs['mealId']);
    var _mediaquery = MediaQuery.of(context).size;
    // print('h ${_mediaquery.height}');
    return Scaffold(
      appBar: AppBar(
        title: Text(currentMeal.title),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              currentMeal.imageUrl,
              width: double.infinity,
              height: _mediaquery.height * 0.3,
              fit: BoxFit.fitWidth,
            ),
            SectionTitle(
              context: context,
              title: 'Ingredients',
            ),
            SectionList(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(currentMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: currentMeal.ingredients.length,
              ),
            ),
            SectionTitle(
              context: context,
              title: 'Steps',
            ),
            SectionList(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text((index+1).toString()),
                    ),
                    title: Text(currentMeal.steps[index]),
                  );
                },
                itemCount: currentMeal.steps.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final BuildContext context;

  const SectionTitle({this.title, this.context});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

class SectionList extends StatelessWidget {
  final Widget list;

  const SectionList(this.list);

  @override
  Widget build(BuildContext context) {
    var _mediaquery = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        padding: const EdgeInsets.all(4.0),
        height: _mediaquery.height * 0.22,
        width: _mediaquery.width * 2 / 3,
        child: list);
  }
}
