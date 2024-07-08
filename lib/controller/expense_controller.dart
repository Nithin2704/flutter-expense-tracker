import 'package:get/get.dart';
import 'package:flutter_expense_tracker/models/item.dart';

class ExpenseController extends GetxController {
  var items = <Item>[].obs;
  var total = 0.0.obs;

  void addItem(String name, double price) {
    items.add(Item(name: name, price: price));
    total.value += price;
  }
}
