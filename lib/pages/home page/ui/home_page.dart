import 'package:flutter/material.dart';
import 'package:foodorderapp/common%20widgets/my_drawer.dart';
import 'package:foodorderapp/common%20widgets/my_sliver_app_bar.dart';
import 'package:foodorderapp/model/food_model.dart';
import 'package:foodorderapp/Resources/restaurant.dart';
import 'package:foodorderapp/pages/food%20details%20page/ui/food_details_page.dart';
import 'package:foodorderapp/pages/home%20page/widget/my_current_location.dart';
import 'package:foodorderapp/pages/home%20page/widget/my_description_box.dart';
import 'package:foodorderapp/pages/home%20page/widget/my_food_tiles.dart';
import 'package:foodorderapp/pages/home%20page/widget/my_tab_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tab controlller
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //sort out and return a list of food items that belongs to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.foodCategory == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      //get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          //get individual food
          final food = categoryMenu[index];

          //return food tile UI
          return FoodTiles(
            food: food,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodDetailsPags(
                      food: food,
                    ),
                  ));
            },
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MySliverAppBar(
              title: MyTabBar(tabController: _tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),

                  //My Current Location
                  const MyCurrentLocation(),

                  //Description box
                  const MyDescriptionBox(),
                ],
              ),
            )
          ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) {
              return TabBarView(
                  controller: _tabController,
                  children: getFoodInThisCategory(restaurant.menu));
            },
          ),
        ));
  }
}
