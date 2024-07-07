// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:foodorderapp/common%20widgets/my_button.dart';
import 'package:foodorderapp/model/food_model.dart';
import 'package:foodorderapp/Resources/restaurant.dart';
import 'package:provider/provider.dart';

class FoodDetailsPags extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodDetailsPags({
    super.key,
    required this.food,
  }) {
    //initialize Selected Addons to be flase
    for (Addon addons in food.availableAddons) {
      selectedAddons[addons] = false;
    }
  }

  @override
  State<FoodDetailsPags> createState() => _FoodDetailsPagsState();
}

class _FoodDetailsPagsState extends State<FoodDetailsPags> {
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    //close the current food page to go back menu
    Navigator.pop(context);

    //format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addons in widget.food.availableAddons) {
      if (widget.selectedAddons[addons] == true) {
        currentlySelectedAddons.add(addons);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                //food image
                SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: Image.asset(
                      widget.food.imagePath,
                      fit: BoxFit.fill,
                    )),

                Padding(
                  padding: const EdgeInsets.only(
                      right: 25, left: 25, bottom: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(
                        widget.food.name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),

                      //price
                      Text(
                        "\$${widget.food.price}",
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary),
                      ),

                      //food discription
                      Text(
                        widget.food.description,
                        style: TextStyle(
                            fontSize: 16,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),

                      //addons
                      Text(
                        "Add-ons",
                        style: TextStyle(
                            fontSize: 16,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      //addons
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                            )),
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 10),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            Addon addons = widget.food.availableAddons[index];
                            return CheckboxListTile(
                              title: Text(
                                addons.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              subtitle: Text(
                                "\$${addons.price}",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              value: widget.selectedAddons[addons],
                              onChanged: (value) {
                                setState(() {
                                  widget.selectedAddons[addons] = value!;
                                });
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),

                //button -> add to cart
                MyButton(
                    text: "Add to cart",
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.transparent,
                          behavior: SnackBarBehavior.floating,
                          elevation: 0,
                          content: Container(
                            height: 50,
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Text(
                                    "Added to card",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ),
                                Icon(Icons.shopping_cart,
                                    size: 20, color: Colors.white)
                              ],
                            ),
                          ),
                        ),
                      );
                      addToCart(widget.food, widget.selectedAddons);
                    }),

                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),

          //back button
          SafeArea(
            child: Container(
              margin: const EdgeInsets.only(left: 12, top: 8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.secondary),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
