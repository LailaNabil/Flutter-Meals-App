import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal currentMeal;

  const MealItem({Key key, this.currentMeal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cardHeight = 250;
    return LayoutBuilder(
      builder: (ctx,constraints){
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Stack(
            children: [
              Container(
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                child: Image.network(
                  currentMeal.imageUrl,
                  height: cardHeight - 50,
                  width: constraints.maxWidth,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                height: cardHeight,
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.access_time_sharp),
                          SizedBox(
                            width: 5,
                          ),
                          Text("${currentMeal.duration} min"),
                        ],
                      ),
                      Text(currentMeal.complexity
                          .toString()
                          .substring("complexity.".length)),
                      Text(currentMeal.affordability
                          .toString()
                          .substring("affordability.".length)),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
