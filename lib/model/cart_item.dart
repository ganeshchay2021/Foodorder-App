// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:foodorderapp/model/food_model.dart';

class CartItem {
  Food food;
  List<Addon> selectedAddons;
  int quantity;
  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    double addonsPrice =
        selectedAddons.fold(0, (sum, addons) => sum + addons.price);
    return (food.price + addonsPrice) * quantity;
  }
}
