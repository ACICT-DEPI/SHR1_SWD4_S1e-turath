import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/cart/cart_provider.dart';
import 'package:turath/features/cart/priceitem_screen.dart';
import 'package:turath/features/cart/checkout_screen.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => CartState();
}

class CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    // دالة لتحويل السعر من نص إلى عدد صحيح
    int _parsePrice(String priceString) {
      return int.parse(priceString.replaceAll(RegExp(r'[\$,]'), ''));
    }

    // دالة لحساب السعر الإجمالي
    int getTotalPrice() {
      int total = 0;
      for (int i = 0; i < cartProvider.prices.length; i++) {
        total += _parsePrice(cartProvider.prices[i]) * cartProvider.quantities[i];
      }
      return total;
    }

    // دالة لجلب العناصر كمصفوفة من PriceItem
    List<PriceItem> getPriceItems() {
      List<PriceItem> items = [];
      for (int i = 0; i < cartProvider.names.length; i++) {
        items.add(PriceItem(
          name: cartProvider.names[i],
          quantity: cartProvider.quantities[i],
          itemCostDollars: double.parse(cartProvider.prices[i]),
          price: cartProvider.prices[i],
          image: cartProvider.images[i],
        ));
      }
      return items;
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "My Cart",
          style: TextStyle(
            color: AppColors.textColorPrimary,
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 15),
            child: Icon(
              Icons.shopping_cart,
              size: 40,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.names.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 57, 57, 57),
                          Color.fromARGB(255, 129, 127, 127)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(cartProvider.images[index]),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 130,
                                    child: Text(
                                      cartProvider.names[index],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 237, 228, 221),
                                        fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.ellipsis,
                                      ),
                                              maxLines: 3,
                                    
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '\$${cartProvider.prices[index]}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 237, 228, 221),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.delete_forever_outlined, color: Color.fromARGB(255, 237, 228, 221)),
                                onPressed: () {
                                  setState(() {
                                    cartProvider.removeItem(index);
                                  });
                                },
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (cartProvider.quantities[index] > 1) {
                                          cartProvider.quantities[index]--;
                                        }
                                      });
                                    },
                                    icon: const Icon(Icons.minimize_outlined, color: Color.fromARGB(255, 237, 228, 221)),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    cartProvider.quantities[index].toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(width: 4),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        cartProvider.quantities[index]++;
                                      });
                                    },
                                    icon: const Icon(Icons.plus_one_sharp, color: Color.fromARGB(255, 237, 228, 221)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(
                      color: Color.fromARGB(255, 237, 228, 221),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${getTotalPrice()}',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 237, 228, 221),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Checkout(
                        priceItems: getPriceItems(), // تمرير العناصر إلى Checkout
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Check out",
                  style: TextStyle(
                    color: Color.fromARGB(255, 237, 228, 221),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(55),
                  backgroundColor: const Color.fromARGB(255, 200, 135, 107),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


