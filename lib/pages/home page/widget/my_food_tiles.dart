// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foodorderapp/model/food_model.dart';

class FoodTiles extends StatelessWidget {
  final Food food;
  final VoidCallback onTap;

  const FoodTiles({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var myPromaryColor =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var mySecondaryColor =
        TextStyle(color: Theme.of(context).colorScheme.primary);

    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name, style:  TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold),),
                      Text(
                        "\$${food.price}",
                        style: mySecondaryColor,
                      ),
                      Text(
                        maxLines: 3, 
                        overflow: TextOverflow.ellipsis,
                        food.description,
                        style: myPromaryColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 150,
                  height: 135,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      food.imagePath,
                      height: 120,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        )
      ],
    );
  }
}
