import 'package:flutter/material.dart';
import 'package:the_meals_app/screens/meal_detail_screen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal currentMeal;
  final Function removeItem;

  const MealItem({Key key, @required this.currentMeal,@required this.removeItem}) : super(key: key);

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName,
        arguments: {'mealId': currentMeal.id}).then((result){
          if(result!=null){
            removeItem(result);
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double cardHeight = 250;
    return InkWell(
      onTap: () => selectMeal(context),
      child: LayoutBuilder(
        builder: (ctx, constraints) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            elevation: 4,
            margin: const EdgeInsets.all(10),
            child: Stack(
              children: [
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
                            Icon(Icons.schedule),
                            SizedBox(
                              width: 5,
                            ),
                            Text("${currentMeal.duration} min"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.work),
                            SizedBox(
                              width: 5,
                            ),
                            Text(currentMeal.complexity
                                .toString()
                                .substring("complexity.".length)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.attach_money),
                            SizedBox(
                              width: 5,
                            ),
                            Text(currentMeal.affordability
                                .toString()
                                .substring("affordability.".length)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: cardHeight - 50,
                  width: constraints.maxWidth,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          topLeft: Radius.circular(15.0)),
                      child: Image.network(
                        currentMeal.imageUrl,
                        fit: BoxFit.fitWidth,
                      )),
                ),
                Positioned(
                  bottom: 70,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    width: constraints.maxWidth * 3 / 5,
                    color: Colors.black45,
                    alignment: Alignment.center,
                    child: Text(
                      currentMeal.title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.grey.shade200,
                          ),
                    ),
                  ),
                ),
                // Container(
                //   height: cardHeight - 50,
                //   width: constraints.maxWidth,
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //           fit: BoxFit.fitWidth,
                //           image: NetworkImage(currentMeal.imageUrl)),
                //       color: Colors.teal,
                //       borderRadius: BorderRadius.only(
                //           topRight: Radius.circular(15.0),
                //           topLeft: Radius.circular(15.0))),
                //   child: Container(
                //     width: constraints.maxWidth * 3 /2,
                //     alignment: Alignment.bottomRight,
                //     padding: EdgeInsets.only(bottom: 10),
                //     child: Text(
                //       currentMeal.title,
                //       style: Theme.of(context).textTheme.headline5.copyWith(
                //             backgroundColor: Colors.black45,
                //             color: Colors.grey.shade200,
                //
                //           ),
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
