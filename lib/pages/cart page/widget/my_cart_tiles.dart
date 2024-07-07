import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodorderapp/model/cart_item.dart';
import 'package:foodorderapp/Resources/restaurant.dart';
import 'package:foodorderapp/pages/cart%20page/widget/quantity_selector.dart';

class MyCartTiles extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTiles({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      height: 100,
                      width: 100,
                      cartItem.food.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 5),
                  // Name and price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.food.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${cartItem.food.price}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.inversePrimary,
                              ),
                            ),
                            const Spacer(), // Adding the Spacer here
                            // Increment or decrement quantity
                            QuantitySelector(
                              quantity: cartItem.quantity,
                              food: cartItem.food,
                              onIncrement: () {
                                restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                              },
                              onDecrement: () {
                                
                                restaurant.removeFromCart(cartItem);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                scrollDirection: Axis.horizontal,
                children: cartItem.selectedAddons
                    .map(
                      (addons) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          label: Row(
                            children: [
                              // Addon name
                              Text(addons.name),
                              const SizedBox(width: 10),
                              // Addon price
                              Text("(\$${addons.price})"),
                            ],
                          ),
                          onSelected: (value) {},
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
