import 'package:FoodDeliveryAppUI/models/food.dart';
import 'package:FoodDeliveryAppUI/models/restaurant.dart';

class Order {
  final Restaurant restaurant;
  final Food food;
  final String date;
  final int quantity;

  Order({
    this.date,
    this.restaurant,
    this.food,
    this.quantity,
  });
}
