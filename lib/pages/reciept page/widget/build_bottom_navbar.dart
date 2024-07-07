import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class BuildBottomNavBar extends StatelessWidget {
  const BuildBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(seconds: 2),
      child: Container(
        margin: const EdgeInsets.only(bottom: 7, right: 5, left: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 70,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            //profile pic of Driver
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle),
              child:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
            ),
            const SizedBox(
              width: 10,
            ),
            //driver details
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ganesh Chaudhary",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Text(
                  "Driver",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
            const Spacer(),
            //message button
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            ),

            const SizedBox(
              width: 10,
            ),
            //call button
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call,
                    color: Colors.green,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
