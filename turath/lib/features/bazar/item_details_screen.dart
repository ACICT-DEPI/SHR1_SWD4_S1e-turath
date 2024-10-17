import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/core/utils/app_text_style.dart';
import 'package:turath/features/bazar/popup.dart';
import 'package:turath/features/components/customappbar.dart';

class ItemDetailPage extends StatefulWidget {
  final item;

  ItemDetailPage({required this.item});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  bool isFavorite = false; // حالة المفضل

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; // تغيير حالة المفضل
      // هنا يمكنك إضافة الكود لإضافة العنصر إلى قائمة المفضل
      // مثال: favoritesList.add(widget.item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(name: widget.item.title,),
      // AppBar(
      //   title: Text(
      //     widget.item.title,
      //     style: AppTextStyle.headLineW700S32
      //         .copyWith(color: AppColors.textColorPrimary),
      //   ),
      //   backgroundColor: AppColors.primaryColor,
      // ),
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(widget.item.image, height: 200),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                widget.item.title,
                style: AppTextStyle.headLineW600S24
                    .copyWith(color: AppColors.textColorPrimary),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                '${widget.item.price} EGP',
                style: AppTextStyle.headLineW600S24
                    .copyWith(color: AppColors.textColorSecondary),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                gradient: AppColors.cardBgColor,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    blurRadius: 8.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                widget.item.description,
                style: AppTextStyle.arabicTextW700S18
                    .copyWith(color: AppColors.textColorPrimary),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 50), // تباعد بين الوصف والأزرار
            Row(
              children: [
                // زر المفضل
                Expanded(
                  flex: 1, // 25% من العرض
                  child: Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      gradient: AppColors.cardBgColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: toggleFavorite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite
                                ? Colors.red
                                : AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => QuantityPopup(item: widget.item),
                      );
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: AppColors.textColorSecondary,
                    ),
                    label: Text('Add to Cart',
                        style: AppTextStyle.headLineW500S24
                            .copyWith(color: AppColors.textColorSecondary)),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 32),
                      backgroundColor: AppColors.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
