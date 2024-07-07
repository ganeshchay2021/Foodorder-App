import 'package:flutter/material.dart';
import 'package:foodorderapp/Resources/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    TextEditingController addressController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Your Location",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        content: TextField(
          controller: addressController,
          decoration: InputDecoration(
              hintText: "Enter Address",
              hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary)),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          MaterialButton(
            onPressed: () {
              String newAddress = addressController.text;
              context.read<Restaurant>().updatedDeliveryAddress(newAddress);
              Navigator.pop(context);
            },
            child: Text(
              "Save",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivered Location",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Consumer<Restaurant>(
                  builder: (context, address, child) {
                    return Text(address.deliveryAddress, style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),);
                  },
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
