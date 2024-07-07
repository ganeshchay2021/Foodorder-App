import 'package:flutter/material.dart';
import 'package:foodorderapp/model/food_model.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({
    super.key,
    required this.tabController,
  });

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // var myColor = Theme.of(context).colorScheme.inversePrimary;
    return SizedBox(
      child: TabBar(
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        unselectedLabelColor: Theme.of(context).colorScheme.primary,
        labelColor: Theme.of(context).colorScheme.inversePrimary,
        controller: tabController,
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}
