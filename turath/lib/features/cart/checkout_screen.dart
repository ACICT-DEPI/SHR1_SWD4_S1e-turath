import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turath/features/cart/cart_provider.dart';
import 'package:turath/features/cart/priceitem_screen.dart';
import 'package:turath/features/home/home_screen.dart';
import 'package:provider/provider.dart';

class Checkout extends StatelessWidget {
  final List<PriceItem> priceItems;

  const Checkout({Key? key, required this.priceItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // حساب المجموع الفرعي والضرائب والمجموع الكلي
    double subtotal = priceItems.fold(0, (sum, item) => sum + (item.itemCostDollars * item.quantity));
    double tax = subtotal * 0.07; // افتراض نسبة الضرائب 7%
    double total = subtotal + tax;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 25, 25),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 200, 135, 107)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Check Out',
          style: TextStyle(color: Color.fromARGB(255, 237, 228, 221), fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Items:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: priceItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      '${priceItems[index].name}',
                      style: const TextStyle(color: Color.fromARGB(255, 237, 228, 221)),
                    ),
                    subtitle: Text(
                      'Quantity: ${priceItems[index].quantity}',
                      style: const TextStyle(color: Color.fromARGB(255, 237, 228, 221)),
                    ),
                    trailing: Text(
                      '\$${(priceItems[index].itemCostDollars * priceItems[index].quantity).toStringAsFixed(2)}',
                      style: const TextStyle(color: Color.fromARGB(255, 237, 228, 221)),
                    ),
                  );
                },
              ),
            ),
            const Divider(color: Color.fromARGB(255, 200, 135, 107)),
            Text(
              'Subtotal: \$${subtotal.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 237, 228, 221)),
            ),
            Text(
              'Tax (7%): \$${tax.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 237, 228, 221)),
            ),
            Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 237, 228, 221), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  // احصل على CartProvider
                  final cartProvider = Provider.of<CartProvider>(context, listen: false);
                  
                  // إزالة العناصر من السلة
                  cartProvider.clearCart(); // تأكد من وجود دالة clearCart في CartProvider

                  // الانتقال إلى صفحة Home
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Pay Now",
                  style: TextStyle(color: Color.fromARGB(255, 237, 228, 221)),
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
          ],
        ),
      ),
    );
  }
}













