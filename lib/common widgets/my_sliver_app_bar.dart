// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodorderapp/Resources/restaurant.dart';
import 'package:foodorderapp/pages/cart%20page/ui/add_to_cart_page.dart';
import 'package:provider/provider.dart';

class MySliverAppBar extends StatefulWidget {
  final Widget title;
  final Widget child;
  const MySliverAppBar({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  @override
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      iconTheme:
          IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
      expandedHeight: 320,
      collapsedHeight: 120,
      pinned: true,
      floating: false,
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddToCart(),
                    ));
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            Consumer<Restaurant>(
              builder: (context, cartNumber, child) {
                return Positioned(
                  top: 6,
                  right: 8,
                  child: Container(
                    alignment: Alignment.center,
                    height: 14,
                    width: 14,
                    decoration: BoxDecoration(
                        color: cartNumber.cart.isEmpty
                            ? Colors.transparent
                            : Colors.red,
                        shape: BoxShape.circle),
                    child: cartNumber.cart.isNotEmpty
                        ? Text("${cartNumber.cart.length}", style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),)
                        : const Text(""),
                  ),
                );
              },
            )
          ],
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      title: Text(
        "Sunset Dinner",
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: widget.child,
        ),
        title: widget.title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
