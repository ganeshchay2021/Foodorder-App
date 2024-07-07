// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foodorderapp/common%20widgets/my_button.dart';
import 'package:foodorderapp/pages/cart%20page/widget/my_cart_tiles.dart';
import 'package:foodorderapp/pages/payment%20page/ui/payment_page.dart';
import 'package:provider/provider.dart';

import 'package:foodorderapp/Resources/restaurant.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;

        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  userCart.isNotEmpty
                      ? showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "Are you sure want to clear the cart?",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              actions: [
                                //cancel button
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),

                                //yes button
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      restaurant.clearCart();
                                    },
                                    child: const Text("yes",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)))
                              ],
                            );
                          },
                        )
                      : showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "Cart is Empty",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              actions: [
                                //cancel button
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                },
                icon: const Icon(
                  Icons.delete,
                ),
              )
            ],
            centerTitle: true,
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: Column(
            children: [
              userCart.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          final cartItem = userCart[index];

                          //return cart tile UI
                          return MyCartTiles(
                            cartItem: cartItem,
                          );
                        },
                      ),
                    )
                  : Expanded(
                      child: Center(
                        child: Text("Cart is Empty",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary)),
                      ),
                    ),
              userCart.isNotEmpty
                  ? MyButton(
                      text: "Checkout",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentPage(),
                          ),
                        );
                      },
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        );
      },
    );
  }
}
