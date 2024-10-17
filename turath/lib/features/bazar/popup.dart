import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/core/utils/app_text_style.dart';
import 'package:turath/features/cart/cart_provider.dart';
import 'package:provider/provider.dart'; 


class QuantityPopup extends StatefulWidget {
  final item;

  QuantityPopup({required this.item});

  @override
  _QuantityPopupState createState() => _QuantityPopupState();
}

class _QuantityPopupState extends State<QuantityPopup> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        'Select Quantity',
        style: AppTextStyle.headLineW500S24
            .copyWith(color: AppColors.textColorSecondary),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              if (quantity > 1) {
                setState(() {
                  quantity--;
                });
              }
            },
            icon: const Icon(Icons.remove, color: Colors.red),
          ),
          Text(
            quantity.toString(),
            style: AppTextStyle.bodyTextW400S32
                .copyWith(color: AppColors.textColorPrimary),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                quantity++;
              });
            },
            icon: const Icon(Icons.add, color: Colors.green),
          ),
        ],
      ),
      actions: [
  TextButton(
    onPressed: () {
      // إضافة العنصر إلى السلة
      Provider.of<CartProvider>(context, listen: false).addToCart(widget.item, quantity);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${widget.item.title} added to cart! Quantity: $quantity'),
      ));
    },
    child: Text(
      'Add to Cart',
      style: AppTextStyle.bodyTextW500S18
          .copyWith(color: AppColors.textColorPrimary),
    ),
  ),
],

    );
  }
}
