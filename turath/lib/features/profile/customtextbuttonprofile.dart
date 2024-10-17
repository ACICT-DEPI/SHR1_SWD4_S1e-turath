import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/core/utils/app_text_style.dart';

class Customtextbuttonprofile extends StatelessWidget {
  final String name;
  final Icon icon;
  final void Function()? onPressed;

  const Customtextbuttonprofile(
      {super.key,
      required this.name,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),
        ),
        side: BorderSide(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          // gradient: const  LinearGradient(
          //         colors: [
          //            Color.fromARGB(255, 12, 6, 6),
          //            Color.fromARGB(255, 129, 127, 127)
          //         ],
          //         begin: Alignment.centerLeft,
          //         end: Alignment.topRight,
          //       ),
          gradient: AppColors.cardBgColor,
          borderRadius: BorderRadius.circular(19),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(
                    icon.icon,
                    color: AppColors.primaryColor,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    name,
                    style: AppTextStyle.headLineW600S13.copyWith(
                        color: AppColors.textColorPrimary, fontSize: 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
