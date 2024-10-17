import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<String> images = [];
  List<String> names = [];
  List<int> quantities = [];
  List<String> prices = [];

  void addToCart(item, int quantity) {
    names.add(item.title);
    images.add(item.image); // تأكد من وجود خاصية image في الكائن item
    quantities.add(quantity);
    prices.add('${item.price}'); // تأكد من وجود خاصية price في الكائن item
    notifyListeners(); // Notify listeners to rebuild UI
  }

  int getTotalPrice() {
    int total = 0;
    for (int i = 0; i < prices.length; i++) {
      total += int.parse(prices[i].replaceAll(RegExp(r'[\$,]'), '')) * quantities[i];
    }
    return total;
  }

    void removeItem(int index) {
    names.removeAt(index);
    images.removeAt(index);
    quantities.removeAt(index);
    prices.removeAt(index);
    notifyListeners(); // لإبلاغ المستمعين بحدوث تغيير
  }

    void clearCart() {
    names.clear();
    images.clear();
    quantities.clear();
    prices.clear();
    notifyListeners(); // لإعلام المستمعين بالتغييرات
  }


}
