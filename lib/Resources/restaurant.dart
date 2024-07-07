import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:foodorderapp/model/cart_item.dart';
import 'package:foodorderapp/model/food_model.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //burger
    Food(
      name: "Classic Hamburger",
      description:
          "a flat round cake of minced beef, fried or grilled and typically served in a bread roll garnished with various condiments; a burger",
      imagePath: "assets/burger/hamburger.jpg",
      price: 7,
      foodCategory: FoodCategory.burger,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.52),
        Addon(name: "Sauteed mushrooms", price: 0.63),
        Addon(name: "Tomato", price: 0.39),
      ],
    ),

    Food(
      name: "Turkey Burger",
      description:
          "This turkey burger recipe comes together in 20 minutes with simple ingredients, making it perfect for a quick and easy dinner.",
      imagePath: "assets/burger/Turkey Burger.jpeg",
      price: 9.64,
      foodCategory: FoodCategory.burger,
      availableAddons: [
        Addon(name: "mayo", price: 0.25),
        Addon(name: "Extra Cheese", price: 0.35),
        Addon(name: "lettuce", price: 0.45),
        Addon(name: "sliced tomatoes.", price: 0.55),
      ],
    ),

    Food(
      name: "Classic Cheeseburger",
      description:
          "A juice beef with melted chadar, lettuce, tomato, and a hind",
      imagePath: "assets/burger/classic cheeseburgers.jpg",
      price: 12,
      foodCategory: FoodCategory.burger,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Onions", price: 0.19),
        Addon(name: "Bacon", price: 0.29),
      ],
    ),
    Food(
      name: "Lamb Burger",
      description:
          "This tasty lamb burger recipe adds fresh rosemary, thyme, and garlic to ground lamb patties before they're cooked to perfection on the grill.",
      imagePath: "assets/burger/Lamb burger.jpg",
      price: 0.99,
      foodCategory: FoodCategory.burger,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.52),
        Addon(name: "Sauteed mushrooms", price: 0.63),
        Addon(name: "Tomato", price: 0.39),
      ],
    ),
    Food(
      name: "Chicken Burger",
      description:
          "Crispy Fried Chicken Burger - ultra crunchy outside and super juicy inside. Way better than KFC burgers!",
      imagePath: "assets/burger/chicken burger.jpeg",
      price: 0.99,
      foodCategory: FoodCategory.burger,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Onions", price: 0.19),
        Addon(name: "Bacon", price: 0.29),
        Addon(name: "Extra chicken", price: 1.5),
      ],
    ),

    //salads
    Food(
      name: "Caesar Salad",
      description:
          "This easy Caesar salad recipe stars romaine lettuce, homemade croutons, Parmesan cheese, and a creamy homemade Caesar dressing. A great main or side dish!",
      imagePath: "assets/salad/Caesar Salad.jpg",
      price: 10.99,
      foodCategory: FoodCategory.salads,
      availableAddons: [
        Addon(name: "fresh lemon", price: 0.09),
        Addon(name: "Worcestershire sauce", price: 0.22),
        Addon(name: "small garlic cloves", price: 0.08),
      ],
    ),
    Food(
      name: " Fruits Salad",
      description:
          "This fantastic fruit salad combines pineapple, kiwi, bananas, oranges, grapes, and berries in a sweet citrusy sauce for a colorful dessert.",
      imagePath: "assets/salad/Fruit salad.jpg",
      price: 40.9,
      foodCategory: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra mango", price: 0.12),
        Addon(name: "Extra kiwi", price: 0.23),
        Addon(name: "Extra banana", price: 0.05),
      ],
    ),

    Food(
      name: "Chef Salad",
      description:
          "Tear the lettuce into bite-sized pieces and put into a large mixing bowl. Season with salt and pepper to taste and toss with 1/2 cup of the dressing.",
      imagePath: "assets/salad/chef salad.jpeg",
      price: 3.59,
      foodCategory: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra eggs", price: 0.95),
        Addon(name: "cherry tomatoes", price: 0.49),
        Addon(name: "Extra croutons", price: 0.39),
      ],
    ),

    Food(
      name: "Chicken Salad",
      description:
          "My quick and easy, classic chicken salad recipe made healthier and lighter to make the perfect homemade chicken salad sandwich.",
      imagePath: "assets/salad/chicken salad.jpeg",
      price: 0.99,
      foodCategory: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra chicken", price: 1.25),
        Addon(name: "Raw onions ", price: 0.24),
        Addon(name: "Extra Vinegar", price: 0.32),
      ],
    ),

    Food(
      name: "Oliver Salad",
      description:
          "Authentic Russian salad recipe, aka olivye, made with boiled potatoes, carrot, and eggs mixed with pickles, ham, and peas in a mayonnaise dressing.",
      imagePath: "assets/salad/salad.jpeg",
      price: 0.99,
      foodCategory: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra peas", price: 0.065),
        Addon(name: "Extra pickles", price: 0.38),
        Addon(name: "Extra carrot", price: 0.77),
      ],
    ),

    //sides
    Food(
      name: "Backed Potatoes",
      description:
          "A perfect baked potato has crispy skin and fluffy insides. This method for how to bake a potato works every time! Add your favorite toppings, and dig in!",
      imagePath: "assets/sides/baked potatoes.jpeg",
      price: 4.44,
      foodCategory: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Sour cream", price: 0.56),
        Addon(name: "black beans", price: 0.27),
        Addon(name: "Pico de gallo", price: 0.35),
      ],
    ),
    Food(
      name: "Asparagus",
      description:
          "asparagus, (genus Asparagus), genus of the family Asparagaceae with up to 300 species native from Siberia to southern Africa. Best known is the garden",
      imagePath: "assets/sides/Asparagus.jpeg",
      price: 3.68,
      foodCategory: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Oregano", price: 0.69),
        Addon(name: "Extra Pistachio", price: 0.25),
      ],
    ),
    Food(
      name: "Mashed Potatoes",
      description:
          "This mashed potato recipe makes the best homemade mashed potatoes with just potatoes, milk, and butter — guaranteed to be smooth, creamy, and delish.",
      imagePath: "assets/sides/mashed potatoes.jpg",
      price: 4.29,
      foodCategory: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra sald", price: 0.15),
        Addon(name: "Add Alliums", price: 0.45),
        Addon(name: "Extra Garnish", price: 0.19),
      ],
    ),
    Food(
      name: "Baked Beans",
      description:
          "Baked beans are a dish traditionally containing white common beans that are parboiled and then, in the US, baked in sauce at low temperature for a lengthy",
      imagePath: "assets/sides/baked beans.jpg",
      price: 4.92,
      foodCategory: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra sugar", price: 0.59),
        Addon(name: "Extra molasses", price: 0.39),
        Addon(name: "Extra sauce", price: 0.56),
      ],
    ),
    Food(
      name: "Fried Potatoes Sides",
      description:
          "Fried Potatoes known in some parts of the United Kingdom as a jacket potato, is a preparation of potato originating from South America, specifically Peru. It may be served with fillings, toppings or condiments such as butter, cheese, sour cream, gravy, baked beans, and tuna, among others.",
      imagePath: "assets/sides/sides.jpg",
      price: 0.99,
      foodCategory: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra fried potato", price: 0.35),
        Addon(name: "Extra salt", price: 0.65),
        Addon(name: "Extra Cheese", price: 0.75),
      ],
    ),

    //deserts
    Food(
      name: "Cake",
      description:
          "This is a delicious birthday cake with delightful light blue colored cream with colorful sprinkles. It is very fluffy, light, and moist with simple and ",
      imagePath: "assets/desert/cake.jpeg",
      price: 10.00,
      foodCategory: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
      ],
    ),
    Food(
      name: "Cookies",
      description:
          "Cookies are small pieces of text sent to your browser by a website you visit.",
      imagePath: "assets/desert/cookies.jpeg",
      price: 1.00,
      foodCategory: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra cookies", price: 0.99),
      ],
    ),
    Food(
      name: "Pastries",
      description:
          "Pastries were first created by the ancient Egyptians. The classical period of ancient Greece and Rome had pastries made with almonds, flour, honey, and seeds.",
      imagePath: "assets/desert/Pastries.jpg",
      price: 1.69,
      foodCategory: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Pastries", price: 0.46),
      ],
    ),
    Food(
      name: "Custards and Puddings",
      description:
          "Custards and Puddings · Rice Pudding · Creme Brulee · Flan · Banana Pudding · Chocolate Pudding · Chia Pudding · Christmas Pudding · Bread Pudding.",
      imagePath: "assets/desert/Custards and Puddings.jpeg",
      price: 2.2,
      foodCategory: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Custards", price: 0.79),
        Addon(name: "Extra Puddings", price: 0.89),
      ],
    ),
    Food(
      name: "Milk Cake",
      description:
          "This delicious tres leches cake recipe combines 3 types of milk that soak into the cake making it extra moist. It's topped with sweet whipped cream.",
      imagePath: "assets/desert/milk cake.jpg",
      price: 2.99,
      foodCategory: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra chocolate", price: 0.27),
        Addon(name: "Extra Cheese", price: 0.88),
      ],
    ),

    //drinks

    Food(
      name: "Apple Juice",
      description:
          "Make refreshing Apple Juice at home in 3 exciting flavors using a blender or a cold press juicer. Delectably fruity with a perfect balance.",
      imagePath: "assets/drink/apple juice.jpg",
      price: 1.09,
      foodCategory: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra apple", price: 0.99),
        Addon(name: "Extra apple juice", price: 0.54),
      ],
    ),
    Food(
      name: "Black Berry Juice",
      description:
          "Blueberry Juice recipe with stepwise pics. This refreshing and healthy recipe is made with fresh blueberries, lemon juice, sugar and water.",
      imagePath: "assets/drink/blackberry juice.jpeg",
      price: 18.28,
      foodCategory: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Black Berry", price: 2.99),
        Addon(name: "Extra Black Berry Juice", price: 9.14),
      ],
    ),
    Food(
      name: "Carrot Juice",
      description:
          "Carrot juice is the ultimate immune boosting drink for grownups & kids alike! Check out this recipe and make your own at home.",
      imagePath: "assets/drink/carrot juice.jpeg",
      price: 3.99,
      foodCategory: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Carrot", price: 1.09),
        Addon(name: "Extra Carrot Juice", price: 2.00),
      ],
    ),
    Food(
      name: "Orange Juice",
      description:
          "Fresh orange juice tastes better than concentrate and is loaded with vitamins. Make fresh-squeezed orange juice at home with 1 ingredient in minutes.",
      imagePath: "assets/drink/orange juice.jpeg",
      price: 9.46,
      foodCategory: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra orange", price: 2.99),
        Addon(name: "Extra orange juice", price: 4.99),
      ],
    ),
    Food(
      name: "Strawberry Juice",
      description:
          "This strawberry juice recipe requires just ONE ingredient for a super fresh, fruity, nutritious, strawberry drink. Add-ins and variations!",
      imagePath: "assets/drink/strawberry drink.jpg",
      price: 6.20,
      foodCategory: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra strawberry", price: 1.99),
        Addon(name: "Extra strawberry Juice", price: 3.99),
      ],
    ),
  ];

  //Getter
  List<Food> get menu => _menu;

  //
  final List<CartItem> _cart = [];
  List<CartItem> get cart => _cart;

  //delivery adddress (which user can change/update)
  String deliveryAddress = "Your address";

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //set if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });
//item already exist increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons),
      );
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //gettotal Price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addons in cartItem.selectedAddons) {
        itemTotal += addons.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();    
  }

//updated delivery address
  void updatedDeliveryAddress(String newAddress) {
    deliveryAddress = newAddress;
    notifyListeners();
  }

  //generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln();
    // format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("--------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name}-${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("  Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("----------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  //format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join();
  }
}
