import 'package:flutter/material.dart';
import 'package:foodorderapp/Resources/restaurant.dart';
import 'package:provider/provider.dart';

class MyReciept extends StatelessWidget {
  const MyReciept({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("Thank you for your order!"),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(8)),
            child: Consumer<Restaurant>(
              builder: (context, restaurant, child) {
                return Text(restaurant.displayCartReceipt());
              },
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text("Estimated delivery time in 30 mins"),
        ],
      ),
    );
  }
}
