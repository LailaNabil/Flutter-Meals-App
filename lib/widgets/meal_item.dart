import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal currentMeal;

  const MealItem({Key key, this.currentMeal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cardHeight = 250;
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Stack(
            children: [
              Container(
                height: cardHeight - 50,
                alignment: Alignment.centerRight,
                child: Text(
                  currentMeal.title,
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        backgroundColor: Colors.black12,
                      ),
                ),
              ),
              Container(
                height: cardHeight - 50,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(currentMeal.imageUrl)),
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0))),
                child: Container(
                  width: constraints.maxWidth * 3 /2,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    currentMeal.title,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          backgroundColor: Colors.black45,
                          color: Colors.grey.shade200,
                          // fontSize: 30

                        ),
                  ),
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
